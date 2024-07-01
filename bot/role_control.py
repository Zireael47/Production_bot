from .keyboard import build_keyboard_main
from urllib.parse import urlencode
from hashlib import sha256
from util.crypto import calc_hmac


access_control = {
    "start": [
        "admin", "director", "foreman", "logistician", "manager", "client"
    ],
    "leftovers": ["admin", "director", "foreman", "logistician", "manager"],
    "production": ["admin", "director", "foreman", "logistician", ],
    "production_days": ["admin", "director", "foreman", "logistician", ],
    "warehouse_cost": ["admin", "director"],
    "web_app": ["admin", "client"],
    "my_orders": ["admin", "client"],
}

greeting_admin = """Добрый день, {}!

Я корпоративный бот производственной компании.
Это демонстрационная версия, все данные сгенерированы автоматически.

Мой функционал:
    1. Вывод <b>остатков</b> товаров на складах (кнопка <b>"Остатки"</b>)
    2. Вывод <b>план-факта производства</b> товаров за месяц (кнопка"""\
""" <b>"Производство"</b>)
    3. Вывод факта <b>производства товаров по дням</b> (кнопка """\
"""<b>"Производство по дням"</b>)
    4. Расчет <b>стоимости склада в учетных ценах</b> (кнопка """\
"""<b>"Стоимость склада"</b>)
Я могу отправить <b>полный excel-файл</b> или <b>вывести ответ в сообщении</b>.

Также я могу принимать заказы и выводить список всех активных заказов.
"""\
"""     5. Для создания <b>нового заказа</b> нажмите на кнопку """\
    """<b>"Сделать заказ".</b>\n"""\
    """     6. Чтобы посмотреть <b>все заказы</b>, нажмите на кнопку"""\
    """<b> "Мои заказы".</b>\n"""
"""
Выберите действие на клавиатуре.
"""

greeting_foreman = """Добрый день, {}!
Я корпоративный бот производственной компании. Мой функционал:
    1. Вывод доступных остатков на складах (кнопка "Остатки")
    2. Вывод план-факта производства за месяц (кнопка "Производство")
    3. Вывод факта производства по дням (кнопка "Производство по дням")
Я могу отправить <b>полный excel-файл</b> или <b>вывести ответ в сообщении</b>.
Выберите действие на клавиатуре.
"""

greeting_manager = """Добрый день, {}!
Я бот для проверки наличия товаров на складах производственной компании.
Я могу отправить <b>полный excel-файл</b> или <b>вывести ответ в сообщении</b>.
Выберите действие на клавиатуре.
"""

greeting_logistician = """Добрый день, {}!
Я корпоративный бот производственной компании. Мой функционал:
    1. Вывод доступных остатков на складах (кнопка "Остатки")
    2. Вывод план-факта производства за месяц (кнопка "Производство")
    3. Вывод факта производства по дням (кнопка "Производство по дням")
    4. Вывод списка заказов (кнопка "Заказы")
Я могу отправить <b>полный excel-файл</b> или <b>вывести ответ в сообщении</b>.
<b>Новые заказы я буду присылать в этот чат.</b>
Выберите действие на клавиатуре.
"""
greeting_client = """Добрый день, {}!\n"""\
    """Я корпоративный бот производственной компании для приема заказов.\n"""\
    """     1. Для создания <b>нового заказа</b> нажмите на кнопку """\
    """<b>"Сделать заказ".</b>\n"""\
    """     2. Чтобы посмотреть <b>все заказы</b>, нажмите на кнопку"""\
    """<b> "Мои заказы".</b>\n"""

greetings = {
    "admin": greeting_admin,
    "director": greeting_admin,
    "foreman": greeting_foreman,
    "manager": greeting_manager,
    "logistician": greeting_logistician,
    "client": greeting_client
}


def get_greetings(role, data, bot_token):
    buttons = []
    for button in filter(lambda x: x != "start", access_control):
        if role not in access_control[button]:
            continue

        if button == "leftovers":
            buttons.append({"text": "Остатки"})
        elif button == "production_days":
            buttons.append({"text": "Производство по дням"})
        elif button == "production":
            buttons.append({"text": "Производство"})
        elif button == "mailing":
            buttons.append({"text": "Рассылка"})
        elif button == "warehouse_cost":
            buttons.append({"text": "Стоимость склада"})
        elif button == "my_orders":
            buttons.append({"text": "Мои заказы"})
        elif button == "web_app":
            data = data.copy()
            url = data['base_url']
            if url[-1] != "/":
                url += "/"
            url += "?"

            del data["base_url"]
            secret = sha256(bot_token.encode('utf-8')).digest()
            data["hash"] = calc_hmac(data, secret)
            url += urlencode(data)

            buttons.append({
                "text": "Сделать заказ",
                "url": url,
            })
        else:
            raise ValueError(button)

    return {
        "text": greetings[role],
        "keyboard": build_keyboard_main(buttons)
    }
