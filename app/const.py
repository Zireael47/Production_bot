CONTAINERS = [
    {
        "id": "container_floor_heating_cards",
        "cards": [
            {
                "category": "Маты Base",
                "image_url": "/static/img/base.png",
                "code_type": "Площадь, кв.м.",
                "unit": "шт",
                "info": "<b>Теплый пол мат Base</b><br/>"
                "<b>Мощность</b>: 150 Вт/м.кв.<br/>"
                "<b>Изоляция жил</b>: ПВХ<br/>"
                "<b>Оболочка</b>: ПВХ<br/>"
                "<b>Гарантия</b>: 20 лет<br/>"
                "<b>Эксплуатация</b>: 50 лет",
            },
            {
                "category": "Секции Base",
                "image_url": "/static/img/base_s.png",
                "code_type": "Мощность, Вт",
                "unit": "шт",
                "info": "<b>Кабельные секции Base</b><br/>"
                "<b>Мощность</b>: 18 Вт/м.пог.<br/>"
                "<b>Изоляция жил</b>: ПВХ<br/>"
                "<b>Оболочка</b>: ПВХ<br/>"
                "<b>Гарантия</b>: 20 лет<br/>"
                "<b>Эксплуатация</b>: 50 лет",
            },
            {
                "category": "Маты Premium",
                "image_url": "/static/img/premium.png",
                "code_type": "Площадь, кв.м.",
                "unit": "шт",
                "info": "<b>Теплый пол мат Premium</b><br/>"
                "<b>Сверхтонкое исполнение 3,5 мм</b><br/>"
                "<b>Мощность</b>: 200 Вт/м.кв.<br/>"
                "<b>Изоляция жил</b>: фторопласт<br/>"
                "<b>Оболочка</b>: ПВХ повышеной термостойкости<br/>"
                "<b>Гарантия</b>: 50 лет<br/>"
                "<b>Эксплуатация</b>: 50 лет<br/>",
            },
            {
                "category": "Секции Premium",
                "image_url": "/static/img/premium_s.png",
                "code_type": "Мощность, Вт",
                "unit": "шт",
                "info": "<b>Кабельные секции Premium</b><br/>"
                "<b>Сверхтонкое исполнение 3,5 мм</b><br/>"
                "<b>Мощность</b>: 20 Вт/м<br/>"
                "<b>Изоляция жил</b>: фторопласт<br/>"
                "<b>Оболочка</b>: ПВХ повышеной термостойкости<br/>"
                "<b>Гарантия</b>: 50 лет<br/>"
                "<b>Эксплуатация</b>: 50 лет<br/>",
            },
        ],
    },
    {
        "id": "container_architectural_heating_cards",
        "cards": [
            {
                "category": "Прогрев бетона",
                "image_url": "/static/img/bs.png",
                "code_type": "Длина, м",
                "unit": "шт",
                "info": "<b>Двужильный нагревательный кабель "
                "для прогрева бетона</b><br/>"
                "<b>Оболочка</b>: 4,5 мм<br/>"
                "<b>Мощность</b>: 40 Вт/пог.м.<br/>"
                "<b>Степень защиты</b>: IP 67<br/>"
                "<b>Гарантия</b>: 1 год<br/>",
            },
            {
                "category": "Обогрев кровли",
                "image_url": "/static/img/ks.png",
                "code_type": "Мощность, Вт",
                "unit": "шт",
                "info": "<b>Двужильные кабельные секции "
                "для обогрева кровли </b><br/>"
                "<b>Изоляция жил</b>: негорючий полипропилен<br/>"
                "<b>Оболочка</b>: термостойкий ПВХ<br/>"
                "<b>Мощность</b>: 30 Вт/пог.м.<br/>"
                "<b>Степень защиты</b>: IP 67<br/>"
                "<b>Гарантия</b>: 3 года для систем обогрева кровли,"
                " 5 лет для обогрева открытых площадей<br/>"
            },
        ]
    },
    {
        "id": "container_controllers_cards",
        "cards": [
            {
                "category": "Терморегулятор механический",
                "image_url": "https://shop.stnmoscow.ru/upload/resize"
                             "_cache/iblock/b73/500_500_140cd750bba98"
                             "70f18aada2478b24840a/original.jpg",
                "code_type": "Артикул",
                "unit": "шт",
                "info": "<b>Макс.нагрузка</b>:16A / 3.5 кВт<br/>"
                "<b>Диапазон T, °C</b>: +4...+40<br/>"
            },
            {
                "category": "Терморегулятор электронный",
                "image_url": "https://www.stnmoscow.ru/upload/resize_"
                "cache/iblock/b97/500_500_140cd750bba9870f18aada2478b2"
                "4840a/original-925x925-fit.jpg",
                "code_type": "Артикул",
                "unit": "шт",
                "info": "<b>Макс.нагрузка</b>:16A / 3.5 кВт<br/>"
                "<b>Диапазон T, °C</b>: +4...+40<br/>"
                "<b>Программирование 24/7</b><br/>"
                "<b>Внешний датчик температуры пола</b><br/>"
                "<b>Встроенный датчик температуры воздуха</b><br/>"
            }
        ],
    }
]

for container in CONTAINERS:
    label = ""
    for word in container['id'].split("_")[1:-1]:
        label += word

    for card_id in range(len(container['cards'])):
        card = container['cards'][card_id]
        card["modal_fade_id"] = f"staticBackdrop_{label}_{card_id}"
