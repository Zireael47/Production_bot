import hmac
from hashlib import sha256


def calc_hmac(data, secret: bytes):
    items = filter(lambda item: item[0] != "hash", data.items())
    items = sorted(items, key=lambda item: item[0])
    items = map(lambda item: item[0]+'='+item[1], items)
    payload = bytes('\n'.join(items), 'utf-8')
    return hmac.new(secret, payload, sha256).hexdigest()
