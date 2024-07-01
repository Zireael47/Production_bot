from datetime import datetime
import math
import pandas as pd
from util.db import request_sql
from util.const import warehouses
from bot.cb_class import CallbackOrder


def get_df(file_name: str, conn):
    if "Производство по дням" in file_name:
        query = "SELECT * FROM production"
        data = request_sql(conn, query)
        df = pd.DataFrame(data, columns=[
            "Месяц", "Дата", "Тип", "Цех",
            "Категория", "Артикул АП", "Порядок", "Количество"
        ])
        return df
    elif "Производство" in file_name:
        query = "SELECT prod.month, prod.workshop, prod.category, "\
                "prod.code_ap, prod.ord, prod.fact "\
                "FROM (SELECT month, workshop, category, code_ap, ord, "\
                "SUM(count) AS fact "\
                "FROM production "\
                "GROUP BY month, category, ord, code_ap) prod"
        data = request_sql(conn, query)
        names = ["month", "workshop", "category", "code_ap", "ord", "fact"]
        df_prod = pd.DataFrame(data, columns=names)

        query = "SELECT plans.month AS month, "\
                "subcategories.workshop AS workshop, "\
                "products.subcategory AS category, "\
                "plans.code_ap AS code_ap, "\
                "products.ord AS ord, "\
                "plans.count AS pl "\
                "FROM plans "\
                "LEFT JOIN products "\
                "ON products.code_ap = plans.code_ap "\
                "LEFT JOIN subcategories "\
                "ON subcategories.subcategory = products.subcategory"
        data = request_sql(conn, query)
        names = ["month", "workshop", "category", "code_ap", "ord", "plan"]
        df_plan = pd.DataFrame(data, columns=names)

        query = "SELECT month, code_ap, SUM(count) FROM production "\
                "WHERE type = 'Переупаковка' "\
                "GROUP BY month, code_ap "
        names = ["month", "code_ap", "repackaging_count"]
        data = request_sql(conn, query)
        df_repack = pd.DataFrame(data, columns=names)

        df_all = pd.merge(
            df_plan, df_prod,
            on=["month", "workshop", "category", "code_ap", "ord"],
            how="outer"
        )
        df_all = pd.merge(
            df_all, df_repack,
            on=["month", "code_ap"],
            how="outer"
        )
        df_all.columns = [
            "Месяц", "Цех", "Субкатегория", "Код АП", "Порядок",
            "План", "Факт", "Из них переупаковка"]
        df_all.drop_duplicates(inplace=True)
        df_all.fillna(0, inplace=True)
        return df_all
    elif "Остатки" in file_name:
        query = "SELECT warehouse, category, subcategory, code, name, amount "\
                "FROM leftovers "\
                "ORDER BY warehouse, category, subcategory, ord"
        data = request_sql(conn, query)
        df = pd.DataFrame(data, columns=[
            "Склад", "Категория", "Субкатегория", "Код",
            "Наименование", "Доступное кол-во"
        ])
        df["Склад"] = df["Склад"].apply(lambda x: warehouses[x])
        return df


def check_user(conn, user_id):
    query = f"SELECT role FROM users WHERE id = {user_id}"

    with conn:
        data = request_sql(conn, query)
    return data[0][0] if data else ""


def parse_last_date(conn, subject):
    if "Остатки" in subject:
        query = "SELECT date FROM leftovers_last_update"
        last_date = request_sql(conn, query)[0][0]
        date, time = last_date.split('от ')[1].split(' ')
        date = date.replace("-", ".")
        time = time.split('.')[0]
        text = "<b>Доступные остатки</b>\n" +\
            f"<b>Отчет сформирован {date} в {time}</b>\n"
        file_name = f"Остатки {date} {time}"
    elif "Производство по дням" in subject:
        query = "SELECT date FROM production_last_update"
        last_date = request_sql(conn, query)[0][0]
        date = last_date.split(' ')[1]
        date = date.replace("-", ".")
        text = "<b>Производство по дням</b>\n" +\
            f"<b>Отчет сформирован {date}</b>\n"
        file_name = f"Производство по дням {date}"
    elif "Производство" in subject:
        query = "SELECT date FROM production_last_update"
        last_date = request_sql(conn, query)[0][0]
        date = last_date.split(' ')[1]
        date = date.replace("-", ".")
        text = "<b>Производство</b>\n" +\
            f"<b>Отчет сформирован {date}</b>\n"
        file_name = f"Производство {date}"
    return text, file_name


def drop_nan(list):
    new_list = []
    for item in list:
        try:
            if math.isnan(item):
                new_list.append("Прочее")
        except BaseException:
            new_list.append(item)
    return new_list


def emoji(fact, plan):
    if fact == 0:
        emoji = '&#10060;'
    elif fact < plan:
        emoji = '&#128260;'
    else:
        emoji = '&#9989;'
    return emoji


def get_text(df: pd.DataFrame, groupby: str):
    text = ""
    text += "\n<i>В скобках - переупаковка</i>\n\n"
    cols = ["Факт", "План", "Из них переупаковка"]
    if groupby == "Код АП":
        cols.append("Порядок")
    df = df.groupby([groupby]).sum()[cols].reset_index()
    if groupby == "Код АП":
        df.sort_values(by="Порядок", inplace=True)
    for i in range(len(df)):
        name = df.iloc[i, 0]
        fact = int(df.iloc[i, 1])
        plan = int(df.iloc[i, 2])
        repack = f"({int(df.iloc[i, 3])})" if int(df.iloc[i, 3]) > 0 else ""
        emoji_ = emoji(fact, plan)
        perc = int(fact/plan*100) if plan > 0 else 0
        text += f"<b>{emoji_} {perc}%  {name}:</b>"\
                f" {fact}{repack}/{plan}\n"
    if int(df['Из них переупаковка'].sum()) > 0:
        repack_all = f"({int(df['Из них переупаковка'].sum())})"
    else:
        repack_all = ""
    text += f"\n<b>Итого:</b> {int(df['Факт'].sum())}"\
            f"{repack_all}/{int(df['План'].sum())}"
    return text


def get_order(conn, order_id: int):
    text = ""
    query = f"""SELECT id, shipping_date, dt, comment, user_id
                    FROM orders
                    WHERE id = {order_id}"""
    (order_id, shipping_date, dt, comment, user_id) = request_sql(
        conn, query
    )[0]
    dt = datetime.strptime(
        dt,
        '%Y-%m-%d %H:%M:%S'
    ).strftime("%d.%m.%Y")
    shipping_date = datetime.strptime(
        shipping_date,
        '%Y-%m-%d'
    ).strftime("%d.%m.%Y")
    text_log = "<b>Новый заказ</b>\n"
    text += f"<b>Номер заказа:</b> {order_id}\n"
    text += f"<b>Дата создания:</b> {dt}\n"
    text += f"<b>Дата отгрузки:</b> {shipping_date}\n"
    text += f"<b>Комментарий:</b> {comment}\n\n"

    text += "<b>Состав заказа:</b>\n"
    query = f"""SELECT order_list.category,
                order_list.ord, order_list.amount, prices.price,
                subcategories.units, products.code, products.name
            FROM orders
            LEFT JOIN order_list
                ON orders.id = order_list.order_id
            LEFT JOIN prices
                ON order_list.price_id = prices.id
                AND order_list.ord = prices.ord
                AND order_list.category = prices.category
            LEFT JOIN products
                ON products.code = prices.code
            LEFT JOIN subcategories
                ON subcategories.subcategory = products.subcategory
            WHERE orders.id = {order_id}
            ORDER BY order_list.category, products.ord"""

    data = request_sql(conn, query)
    df = pd.DataFrame(
        data, columns=[
            "cat", "name", "count", "price", 'units', "code", "name_stn"
        ]
    )
    for i in range(len(df)):
        category = df.iloc[i, 0]
        name = df.iloc[i, 1]
        amount = df.iloc[i, 2]
        units = df.iloc[i, 4]
        if (i == 0) or (category != df.iloc[i-1, 0]):
            cat_count = df[df["cat"] == category]["count"].sum()
            text += f"<b>{category}: {cat_count} {units}</b>\n"
        text += f"  <b>{name}</b>: {amount} {units}\n"
    df["total"] = df["count"]*df["price"]

    total = df["total"].sum()
    df = df[["code", "name_stn", "price", 'count', "total"]]
    df.columns = [
        "Код СТН", "Наименование СТН", "Цена", "Количество", "Стоимость"
    ]
    text += f"\n<b>Итого: {total:,.2f} руб.</b>"
    file_name = f"{order_id}"
    text_log += text
    return df, text, text_log, file_name


def get_order_keyboard(conn, order_id: int):
    query = f"""SELECT MIN(id) FROM orders WHERE id > {order_id}
            UNION SELECT MAX(id) FROM orders WHERE id < {order_id}"""
    data = [
        el for el in [
            el[0] for el in request_sql(conn, query)
        ]
        if str(el) != 'None'
    ]
    buttons = []
    for el in data:
        buttons.append(
            [
                f"К заказу {el}",
                CallbackOrder(order=str(el))
            ]
        )
    return buttons
