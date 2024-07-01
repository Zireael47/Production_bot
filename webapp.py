#!flask/bin/python
from hashlib import sha256
from datetime import datetime

from app import app
from app.auth import update_token
from util.config import build_config
from util.crypto import calc_hmac


def new_secret_key(bot_token: bytes):
    return calc_hmac({"auth_date": str(datetime.now())}, bot_token)


if __name__ == "__main__":
    cfg = build_config("config.yaml")
    bot_token_bytes = sha256(cfg["Token"].encode('utf-8')).digest()
    update_token(bot_token_bytes)
    app.config["SECRET_KEY"] = new_secret_key(bot_token_bytes)
    app.config["BOT_URL"] = cfg["Url"]
    app.config["DB_PATH"] = cfg["DBPath"]

    app.run(
        host="0.0.0.0",
        port=8501,
        debug=True,
        # ssl_context=("./ssl/cert.pem", "./ssl/key.pem"),
    )
