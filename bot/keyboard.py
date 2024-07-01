
from aiogram.utils.keyboard import InlineKeyboardBuilder
from aiogram.types.web_app_info import WebAppInfo
from aiogram.types import ReplyKeyboardMarkup, KeyboardButton


def build_keyboard_main(buttons):
    kb = []
    for b in buttons:
        kb.append(
            [
                KeyboardButton(
                    text=b['text'],
                    web_app=WebAppInfo(url=b['url']) if 'url' in b else None,
                )
            ]
        )
    builder = ReplyKeyboardMarkup(
        keyboard=kb,
        input_field_placeholder="Выберите действие",
        resize_keyboard=True
    )
    return builder


def build_keyboard(buttons, in_line):
    builder = InlineKeyboardBuilder()
    for button in buttons:
        builder.button(text=button[0], callback_data=button[1])
    if in_line == 2:
        remainder_but = len(buttons) % 2
        len_but = len(buttons) // 2
        if remainder_but != 0:
            row = [2]*len_but
            builder.adjust(*row, 1)
        else:
            row = [2]*(len_but-1)
            builder.adjust(*row, 1, 1)
    else:
        builder.adjust(in_line)
    return builder
