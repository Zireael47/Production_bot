from flask import request, session
from datetime import datetime, timezone
from util.crypto import calc_hmac
from util.const import DATETIME_FORMAT


bot_token = None


def update_token(token):
    global bot_token
    bot_token = token


def check_session() -> int:
    if session.new or "tg_id" not in session:
        return 401
    return 200


def auth() -> int:
    tg_data = parse_tg_data()

    hmac = calc_hmac(tg_data, bot_token)
    if hmac != tg_data['hash']:
        if check_session() == 200:
            return 200
        return 401

    try:
        auth_dt = datetime.strptime(tg_data["auth_date"], DATETIME_FORMAT). \
            replace(tzinfo=timezone.utc)
    except ValueError:
        return 400

    lad = session["last_auth_date"] if "last_auth_date" in session else None
    if auth_dt > datetime.now(timezone.utc) or \
            (lad is not None and auth_dt < lad):
        return 400

    session.clear()
    session.permanent = True
    session["tg_id"] = tg_data["id"]
    session["last_auth_date"] = auth_dt
    return 200


def parse_tg_data():
    FIELDS = [
        "id",
        "user_name",
        "auth_date",
        "hash",
    ]

    result = {}
    for field in FIELDS:
        result[field] = request.args.get(field, '')
    return result
