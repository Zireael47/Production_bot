import sqlite3

from flask import Flask, render_template, redirect, session, request
from flask.config import Config
from datetime import timedelta
from util.db import request_sql

from . import const
from .auth import auth, check_session


app = Flask(__name__)
app.config.from_object(Config)
app.config["PERMANENT_SESSION_LIFETIME"] = timedelta(hours=1)


@app.route('/')
def index():
    code = auth()
    if code != 200:
        return redirect_to_bot(code)

    user_id = get_user_id()
    with sqlite3.connect(app.config["DB_PATH"]) as conn:
        query = f"""SELECT ord, price, category FROM prices
                    LEFT JOIN clients ON clients.price_id = prices.id
                    WHERE clients.user_id in ({user_id}, 649471710)
                    ORDER BY category, price"""

        data = request_sql(conn, query)

    prices = {}
    for row in data:
        if row[2] not in prices:
            prices[row[2]] = []
        prices[row[2]].append({"ord": row[0], "price": row[1]})

    return render_template(
        "index.html",
        title="Каталог товаров",
        containers=const.CONTAINERS,
        prices=prices,
    )


@app.route('/order')
def order():
    code = check_session()
    if code != 200:
        return redirect_to_bot(code)
    return render_template("order.html", title="Корзина")


@app.route('/order/new', methods=["POST"])
def new_order():
    code = check_session()
    if code != 200:
        return redirect_to_bot(code)

    user_id = get_user_id()

    try:
        with sqlite3.connect(app.config["DB_PATH"]) as conn:
            cursor = conn.cursor()
            ship_date = request.json["params"]["shipping_date"]
            comment = request.json["params"]["comment"]
            query = f"""INSERT INTO orders
                         (user_id, shipping_date, dt, comment)
                         VALUES (
                        {user_id}, "{ship_date}", datetime('now'), "{comment}"
                        )
                         RETURNING id"""
            (order_id, ) = cursor.execute(query).fetchone()

            query = f"""SELECT price_id FROM clients
                        WHERE user_id in ({user_id}, 649471710)"""
            (price_id, ) = cursor.execute(query).fetchone()

            for cat in request.json:
                if cat == "params":
                    continue
                for ord in request.json[cat]:
                    query = f"""SELECT code, price FROM prices
                            WHERE category = '{cat}'
                            AND ord = '{ord}'
                            AND id = {price_id}"""
                    (code, price) = cursor.execute(query).fetchone()
                    amount = request.json[cat][ord]
                    query = create_order_query(
                        order_id, price_id, cat, ord, amount,
                    )
                    cursor.execute(query)
    except sqlite3.OperationalError as err:
        print(f"failed to insert data into db: {err}")
        return {"status": "fail", "error": "internal error"}, 500
    return {"status": "success", "error": ""}, 200


def redirect_to_bot(code):
    print(f"invalid request: status code {code}")
    return redirect(app.config["BOT_URL"])


def get_user_id():
    user_id = session.get("tg_id")
    assert user_id is not None
    return user_id


def create_order_query(order_id, price_id, cat, ord, amount):
    return f"""INSERT INTO order_list(order_id,price_id,category,ord,amount)
    VALUES ({order_id},{price_id},"{cat}","{ord}",{amount})"""
