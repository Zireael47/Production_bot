import logging
import sqlite3
import os
import pandas as pd
from typing import Union, Dict, Any

from datetime import datetime, timezone, timedelta
from aiogram import Bot, Dispatcher, html
from aiogram.filters.command import Command
from aiogram.filters import Filter
from aiogram.types import Message, CallbackQuery, FSInputFile, WebAppData
from aiogram_calendar import SimpleCalendar, SimpleCalendarCallback
from util.config import build_config
from util.const import DATETIME_FORMAT, warehouses
from . import util
from . import role_control
from . import keyboard
from . import cb_class


class Text(Filter):
    def __init__(self, text: str) -> None:
        self.text = text

    async def __call__(self, message: Message) -> bool:
        return message.text == self.text


class WebAppDataFilter(Filter):
    async def __call__(
            self,
            message: Message, **kwargs
    ) -> Union[bool, Dict[str, Any]]:
        if message.web_app_data:
            return dict(web_app_data=message.web_app_data)
        else:
            return False


class TgBot:
    def __init__(self, cfg_path: str):
        cfg = build_config(cfg_path)
        self._logger = TgBot._new_logger(cfg["LogPath"])
        self._file_path = cfg["FilePath"]
        self._token = cfg["Token"]
        self._app_url = cfg["WebAppUrl"]
        self._bot = Bot(cfg["Token"])
        self._conn = sqlite3.connect(cfg["DBPath"])

        self._dp = Dispatcher()
        self._dp.message(Command('start'))(self.start)
        self._dp.message(Text("Остатки"))(self.leftovers)
        self._dp.message(Text("Производство по дням"))(self.production_days)
        self._dp.message(Text("Производство"))(self.production)
        self._dp.message(Text("Стоимость склада"))(self.warehouse_cost)
        self._dp.message(Text("Мои заказы"))(self.my_orders)
        self._dp.message(WebAppDataFilter())(self.get_app_data)
        self._dp.callback_query(
            cb_class.CallbackDownload.filter()
        )(self.download)
        self._dp.callback_query(
            cb_class.CallbackShowLeftovers.filter()
        )(self.leftovers_warehouse)
        self._dp.callback_query(
            cb_class.CallbackChooseWarehouse.filter()
        )(self.leftovers_category)
        self._dp.callback_query(
            cb_class.CallbackChooseCat.filter()
        )(self.leftovers_subcategory)
        self._dp.callback_query(
            cb_class.CallbackChooseSubCat.filter()
        )(self.leftovers_get)

        self._dp.callback_query(
            cb_class.CallbackShowProductionDays.filter()
        )(self.production_calendar)
        self._dp.callback_query(
            SimpleCalendarCallback.filter()
        )(self.get_prod_by_date)

        self._dp.callback_query(
            cb_class.CallbackShowProduction.filter()
        )(self.production_month)
        self._dp.callback_query(
            cb_class.CallbackChooseM.filter()
        )(self.production_workshop)
        self._dp.callback_query(
            cb_class.CallbackChooseWorkShop.filter()
        )(self.production_category)
        self._dp.callback_query(
            cb_class.CallbackChooseCatProd.filter()
        )(self.production_get)

        self._dp.callback_query(
            cb_class.CallbackOrder.filter()
        )(self.get_cb_order)

    async def run(self):
        self._logger.info("run")
        await self._dp.start_polling(self._bot)

    def _new_logger(logpath: str):
        logger = logging.getLogger()
        logger.setLevel(logging.INFO)
        handler = logging.FileHandler(logpath, mode='w', encoding='utf-8')
        formatter = logging.Formatter("%(asctime)s %(levelname)s %(message)s")
        handler.setFormatter(formatter)
        logger.addHandler(handler)
        return logger

    def _log(self, message: Message, role: str, name: str):
        self._logger.info(
            f"user: {message.from_user.id}, "
            f"role: {role}, name: {name}, message: {message.text}"
        )

    def _cb_log(self, message: str, user_id):
        name = self._get_name(user_id)
        role = util.check_user(self._conn, user_id)
        self._logger.info(
            f"user: {user_id}, "
            f"role: {role}, name: {name}, message: {message}"
        )

    def _get_name(self, user_id):
        query = f'SELECT name FROM users WHERE id = {user_id}'
        result = util.request_sql(self._conn, query)
        if result:
            return result[0][0]
        return ""

    def _check_access(func):
        async def authorize(self, message: Message):
            name = self._get_name(message.from_user.id)
            role = util.check_user(self._conn, message.from_user.id)
            if not name:
                name = f"{message.from_user.username}; "
                f"{message.from_user.first_name}"
                role = "admin"
            self._log(message, role, name)

            if role in role_control.access_control[func.__name__]:
                return await func(self, message, role)
            else:
                await message.reply("Вы не авторизированы в системе!")
        return authorize

    @_check_access
    async def start(self, message: Message, role: str):
        user_name = html.quote(message.from_user.first_name)
        auth_dt = datetime.strftime(
            datetime.now(timezone.utc),
            DATETIME_FORMAT
        )
        data = {
            "id": str(message.from_user.id),
            "user_name": user_name,
            "base_url": self._app_url,
            "auth_date": auth_dt,
        }
        greeting = role_control.get_greetings(role, data, self._token)
        await message.answer(
            greeting["text"].format(user_name),
            reply_markup=greeting["keyboard"],
            parse_mode='HTML',
            disable_web_page_preview=True
        )

    @_check_access
    async def production_days(self, message: Message, *args):
        theme = 'Производство по дням '
        builder = keyboard.build_keyboard(
            buttons=[
                ["Скачать файл",
                 cb_class.CallbackDownload(type=theme)],
                ["Вывести в сообщении",
                 cb_class.CallbackShowProductionDays(msg="prodd")]
            ],
            in_line=1
        )
        text = util.parse_last_date(self._conn, theme)[0]
        text += "\n<b>Выберите действие:</b>"
        await message.answer(
            text,
            reply_markup=builder.as_markup(),
            parse_mode='HTML'
        )

    async def production_calendar(
            self,
            callback: CallbackQuery,
            callback_data: cb_class.CallbackShowProductionDays,
            *args
    ):
        text = "Выберите дату"
        self._cb_log("Вывести производство по дням", callback.message.chat.id)
        await callback.message.edit_text(
            text,
            reply_markup=await SimpleCalendar().start_calendar(),
            parse_mode='HTML'
        )
        await callback.answer()

    async def get_prod_by_date(
        self,
        callback: CallbackQuery,
        callback_data: SimpleCalendarCallback,
        *args
    ):
        selected, date = await SimpleCalendar().process_selection(
            callback, callback_data
        )
        if selected:
            date_f = str(date.strftime("%Y-%m-%d"))
            query = "SELECT workshop, category, code_ap, count, type "\
                    "FROM production "\
                    f"WHERE date = '{date_f}' "\
                    "ORDER BY workshop, category, ord"
            data = pd.DataFrame(util.request_sql(self._conn, query))
            text = f"<b>Производство за "\
                f"{date.strftime('%d.%m.%Y')}</b>\n"
            for i in range(len(data)):
                ws = data.iloc[i, 0]
                cat = data.iloc[i, 1]
                type = data.iloc[i, 4]
                name = data.iloc[i, 2].replace('.010', '')
                if type == "Переупаковка":
                    name = name + "*"
                count = int(data.iloc[i, 3])
                count_ws = int(data[data[0] == ws][3].sum())
                count_cat = int(data[data[1] == cat][3].sum())
                if i == 0 or (ws != data.iloc[i-1, 0]):
                    text += f"<b>\n{ws}: {count_ws}</b>\n"\
                        f"  <b>{cat}: {count_cat}</b>\n"\
                        f"      {name}: {count}\n"
                elif data.iloc[i, 1] != data.iloc[i-1, 1]:
                    text += f"\n<b>  {cat}: {count_cat}</b>\n"\
                        f"      {name}: {count}\n"
                else:
                    text += f"      {name}: {count}\n"
            text += "\n<i>* - переупаковка</i>"
        date_prev = date + timedelta(days=-1)
        date_next = date + timedelta(days=1)
        buttons = [
            ["<", SimpleCalendarCallback(
                act="DAY",
                year=date_prev.year,
                month=date_prev.month,
                day=date_prev.day)],
            [">", SimpleCalendarCallback(
                act="DAY",
                year=date_next.year,
                month=date_next.month,
                day=date_next.day)]
        ]
        builder = keyboard.build_keyboard(buttons, in_line=3)
        self._cb_log(
            f"Вывести производство по дням // дата: {date_f}",
            callback.message.chat.id)
        await callback.message.edit_text(text,
                                         reply_markup=builder.as_markup(),
                                         parse_mode='HTML')
        await callback.answer()

    async def download(
        self,
        callback: CallbackQuery,
        callback_data: cb_class.CallbackDownload,
        *args
    ):
        text, file_name = util.parse_last_date(self._conn, callback_data.type)
        file_name = file_name.replace(':', '-')
        df = util.get_df(file_name, self._conn)
        path = os.path.join(self._file_path, f"{file_name}.xlsx")
        df.to_excel(path, index=False)
        self._cb_log(f"Скачать {file_name}", callback.message.chat.id)
        await callback.message.edit_text(text, parse_mode='HTML')
        await callback.message.answer_document(FSInputFile(path=path))
        await callback.answer()

    @_check_access
    async def leftovers(self, message: Message, *args):
        theme = 'Остатки'
        builder = keyboard.build_keyboard(
            buttons=[
                ["Скачать файл",
                 cb_class.CallbackDownload(type=theme)],

                ["Вывести в сообщении",
                 cb_class.CallbackShowLeftovers(msg='show_l')]
            ],
            in_line=1
        )
        text = util.parse_last_date(self._conn, theme)[0]
        text += "\n<b>Выберите действие:</b>"
        await message.reply(
            text,
            reply_markup=builder.as_markup(),
            parse_mode='HTML'
        )

    async def leftovers_warehouse(
        self,
        callback: CallbackQuery,
        *args
    ):
        builder = keyboard.build_keyboard(
            [
                [warehouses["v"],
                    cb_class.CallbackChooseWarehouse(warehouse="v")],
                [warehouses["a"],
                    cb_class.CallbackChooseWarehouse(warehouse="a")],
                [warehouses["m"],
                    cb_class.CallbackChooseWarehouse(warehouse="m")],
            ],
            in_line=1
        )
        text = util.parse_last_date(self._conn, "Остатки")[0]
        text += """\n<b>Выберите склад:</b>"""
        self._cb_log("Вывести остатки", callback.message.chat.id)
        await callback.message.edit_text(text,
                                         reply_markup=builder.as_markup(),
                                         parse_mode='HTML')
        await callback.answer()

    async def leftovers_category(
        self,
        callback: CallbackQuery,
        callback_data: cb_class.CallbackChooseWarehouse,
        *args
    ):
        warehouse = callback_data.warehouse
        query = f"""SELECT DISTINCT category
                    FROM leftovers
                    WHERE warehouse = '{warehouse}'
                    ORDER BY category"""

        data = util.request_sql(self._conn, query)
        categories = [category[0] for category in data]
        categories = util.drop_nan(categories)
        buttons = [
            [
                category,
                cb_class.CallbackChooseCat(
                    warehouse=warehouse,
                    category=category
                )
            ] for category in categories
        ]
        buttons.append(["Назад", cb_class.CallbackShowLeftovers(msg='show_l')])
        builder = keyboard.build_keyboard(buttons, in_line=2)
        text = util.parse_last_date(self._conn, "Остатки")[0]
        text += f"\n<b>Склад:</b> {warehouses[warehouse]}\n\n" +\
            """<b>Выберите категорию:</b> """
        self._cb_log(
            f"Вывести остатки // склад: {warehouses[warehouse]}",
            callback.message.chat.id
        )
        await callback.message.edit_text(text,
                                         reply_markup=builder.as_markup(),
                                         parse_mode='HTML')
        await callback.answer()

    async def leftovers_subcategory(
        self,
        callback: CallbackQuery,
        callback_data: cb_class.CallbackChooseCat,
        *args
    ):
        warehouse = callback_data.warehouse
        category = callback_data.category
        query = f"""SELECT DISTINCT subcategory
                    FROM leftovers
                    WHERE warehouse = '{warehouse}'
                        AND category = '{category}'
                    ORDER BY subcategory"""

        data = util.request_sql(self._conn, query)
        subcategories = [subcategory[0] for subcategory in data]
        subcategories = util.drop_nan(subcategories)
        buttons = [
            [
                subcategory,
                cb_class.CallbackChooseSubCat(
                    warehouse=warehouse,
                    category=category,
                    subcategory=subcategory
                )
            ] for subcategory in subcategories
        ]
        buttons.append(
            [
                "Назад",
                cb_class.CallbackChooseWarehouse(
                    warehouse=warehouse
                )
            ]
        )
        builder = keyboard.build_keyboard(buttons, in_line=2)
        text = util.parse_last_date(self._conn, "Остатки")[0]
        text += f"\n<b>Склад:</b> {warehouses[warehouse]}\n" +\
            f"<b>Категория:</b> {category}\n\n" +\
            """<b>Выберите субкатегорию:</b>"""
        self._cb_log(
            f"Вывести остатки // склад: {warehouses[warehouse]}"
            f" // категория: {category}",
            callback.message.chat.id
        )
        await callback.message.edit_text(text,
                                         reply_markup=builder.as_markup(),
                                         parse_mode='HTML')
        await callback.answer()

    async def leftovers_get(
        self,
        callback: CallbackQuery,
        callback_data: cb_class.CallbackChooseSubCat,
        *args
    ):
        warehouse = callback_data.warehouse
        category = callback_data.category
        subcategory = callback_data.subcategory

        text = util.parse_last_date(self._conn, "Остатки")[0]
        text += f"\n<b>Склад:</b> {warehouses[warehouse]}\n" +\
            f"<b>Категория:</b> {category}\n" +\
            f"<b>Субкатегория:</b> {subcategory}\n\n"

        query = f"""SELECT DISTINCT name, amount
                    FROM leftovers
                    WHERE warehouse = '{warehouse}'
                        AND category = '{category}'
                        AND subcategory = '{subcategory}'
                    ORDER BY ord"""

        data = util.request_sql(self._conn, query)
        total_amount = 0
        for el in data:
            name = el[0]
            amount = int(el[1])
            text += f"<b>{name}</b>: {str(amount)}\n"
            total_amount += amount
        text += f"\n<b>Итого: {total_amount}</b>"
        buttons = [
            [
                "Назад",
                cb_class.CallbackChooseCat(
                    warehouse=warehouse,
                    category=category
                )
            ]
        ]
        builder = keyboard.build_keyboard(buttons, in_line=1)
        self._cb_log(
            f"Вывести остатки // склад: {warehouses[warehouse]} //"
            f" категория: {category} //"
            f" субкатегория: {subcategory}",
            callback.message.chat.id
        )
        await callback.message.edit_text(
            text,
            reply_markup=builder.as_markup(),
            parse_mode='HTML')
        await callback.answer()

    @_check_access
    async def production(self, message: Message, *args):
        theme = 'Производство'
        builder = keyboard.build_keyboard(
            buttons=[
                ["Скачать файл",
                    cb_class.CallbackDownload(type=theme)],
                ["Вывести в сообщении",
                    cb_class.CallbackShowProduction(msg="prod")]
            ],
            in_line=1
        )
        text = util.parse_last_date(self._conn, theme)[0]
        text += "\n<b>Выберите действие:</b>"
        await message.answer(
            text,
            reply_markup=builder.as_markup(),
            parse_mode='HTML'
        )

    async def production_month(
            self,
            callback: CallbackQuery,
            callback_data: cb_class.CallbackShowProduction,
            *args
    ):
        query = "SELECT DISTINCT month FROM production ORDER BY month"
        data = util.request_sql(self._conn, query)
        months = [str(month[0]) for month in data]
        buttons = [
            [
                month,
                cb_class.CallbackChooseM(
                    month=month
                )
            ] for month in months
        ]
        builder = keyboard.build_keyboard(buttons, in_line=3)
        text = util.parse_last_date(self._conn, "Производство")[0]
        text += "<b>Выберите месяц:</b>"
        self._cb_log(
            "Вывести производство",
            callback.message.chat.id
        )
        await callback.message.edit_text(text,
                                         reply_markup=builder.as_markup(),
                                         parse_mode='HTML')
        await callback.answer()

    async def production_workshop(
                self,
                callback: CallbackQuery,
                callback_data: cb_class.CallbackChooseM,
                *args
    ):
        month = int(callback_data.month)
        df = util.get_df("Производство", self._conn)
        df = df[df["Месяц"] == month]
        workshops = list(df["Цех"].unique())
        buttons = [
            [
                workshop,
                cb_class.CallbackChooseWorkShop(
                    month=callback_data.month,
                    workshop=workshop
                )
            ] for workshop in workshops
        ]
        buttons.append(
            ["Назад", cb_class.CallbackShowProduction(msg="prod")]
        )
        builder = keyboard.build_keyboard(buttons, in_line=1)
        text = util.parse_last_date(self._conn, "Производство")[0]
        text += f"<b>Месяц:</b> {callback_data.month}"
        text += util.get_text(df, "Цех")
        text += "\n\n<b>Выберите цех:</b>"
        self._cb_log(
            f"Вывести производство // месяц: {month}",
            callback.message.chat.id
        )
        await callback.message.edit_text(text,
                                         reply_markup=builder.as_markup(),
                                         parse_mode='HTML')
        await callback.answer()

    async def production_category(
                self,
                callback: CallbackQuery,
                callback_data: cb_class.CallbackChooseWorkShop,
                *args
    ):
        month = int(callback_data.month)
        workshop = callback_data.workshop
        df = util.get_df("Производство", self._conn)
        df = df[(df["Месяц"] == month) & (df["Цех"] == workshop)]
        categories = list(df["Субкатегория"].unique())
        buttons = [
            [
                category,
                cb_class.CallbackChooseCatProd(
                    month=str(callback_data.month),
                    workshop=workshop,
                    category=category
                )
            ] for category in categories
        ]
        buttons.append(
            ["Назад", cb_class.CallbackChooseM(month=str(callback_data.month))]
        )
        builder = keyboard.build_keyboard(buttons, in_line=2)
        text = util.parse_last_date(self._conn, "Производство")[0]
        text += f"<b>Месяц:</b> {month}\n"\
                f"<b>Цех:</b> {workshop}"
        text += util.get_text(df, "Субкатегория")
        text += "\n\n<b>Выберите категорию:</b>"
        self._cb_log(
            f"Вывести производство // месяц: {month}"
            f" // цех: {workshop}",
            callback.message.chat.id
        )
        await callback.message.edit_text(text,
                                         reply_markup=builder.as_markup(),
                                         parse_mode='HTML')
        await callback.answer()

    async def production_get(
                    self,
                    callback: CallbackQuery,
                    callback_data: cb_class.CallbackChooseCatProd,
                    *args
    ):
        month = int(callback_data.month)
        workshop = callback_data.workshop
        category = callback_data.category
        df = util.get_df("Производство", self._conn)
        df = df[(df["Месяц"] == month)
                & (df["Цех"] == workshop)
                & (df["Субкатегория"] == category)]
        text = util.parse_last_date(self._conn, "Производство")[0]
        text += f"<b>Месяц:</b> {month}\n"\
                f"<b>Цех:</b> {workshop}\n"\
                f"<b>Категория:</b> {category}"
        text += util.get_text(df, "Код АП")
        buttons = [
            [
                "Назад",
                cb_class.CallbackChooseWorkShop(
                    month=str(callback_data.month),
                    workshop=workshop
                )
            ]
        ]
        builder = keyboard.build_keyboard(buttons=buttons, in_line=1)
        self._cb_log(
            f"Вывести производство // месяц: {month}"
            f" // цех: {workshop} // категория: {category}",
            callback.message.chat.id
        )
        await callback.message.edit_text(
            text,
            reply_markup=builder.as_markup(),
            parse_mode='HTML'
        )
        await callback.answer()

    @_check_access
    async def warehouse_cost(self, message: Message, *args):
        df = util.get_df("Остатки", self._conn)
        query = "SELECT code, accounting_price FROM products"
        data = util.request_sql(self._conn, query)
        df_prices = pd.DataFrame(data, columns=["Код", "Цена"])
        df_all = pd.merge(df, df_prices, on="Код", how="left")
        df_all.fillna(0, inplace=True)
        df_all = df_all[df_all["Цена"] != 0]
        df_all["Стоимость"] = df_all["Доступное кол-во"]*df_all["Цена"]
        df_all = df_all.groupby(
            ["Категория", "Субкатегория"]
        ).sum().reset_index()[["Категория", "Субкатегория", "Стоимость",
                               "Доступное кол-во"]]
        df_all.sort_values(
            by=["Категория", "Стоимость"],
            ascending=[True, False],
            inplace=True
        )
        text = util.parse_last_date(self._conn, "Остатки")[0]
        text = text.replace("Доступные остатки", "Стоимость склада в Д2")
        all = df_all["Стоимость"].sum()/1000000
        text += "<i>Данные в млн руб б/НДС </i>\n"
        text += f"\n<b>Итого</b>: {all:.3f}\n\n"

        for i in range(len(df_all)):
            cat = df_all.iloc[i, 0]
            subcat = df_all.iloc[i, 1]
            cost_cat = df_all[
                df_all["Категория"] == cat
            ]["Стоимость"].sum()/1000000
            count_cat = int(df_all[
                df_all["Категория"] == cat
            ]["Доступное кол-во"].sum())

            cost = df_all.iloc[i, 2]/1000000
            count = int(df_all.iloc[i, 3])

            if i == 0:
                text += f"<b>{cat}: {cost_cat:.3f} / {count_cat}</b>\n"\
                    f"  <b>{subcat}</b>: {cost:.3f} / {count}\n"

            elif df_all.iloc[i, 0] != df_all.iloc[i-1, 0]:
                text += f"\n<b>{cat}: {cost_cat:.3f} / {count_cat}</b>\n"\
                    f"  <b>{subcat}</b>: {cost:.3f} / {count}\n"
            else:
                text += f"  <b>{subcat}</b>: {cost:.3f} / {count}\n"
        await message.answer(text, parse_mode='HTML')

    async def get_app_data(
        self,
        message: Message,
        web_app_data: WebAppData,
        *args
    ):
        user_id = int(message.from_user.id)
        query = f"SELECT MAX(id) FROM orders WHERE user_id = {user_id}"
        order_id = int(util.request_sql(self._conn, query)[0][0])
        df, text, text_log, file_name = util.get_order(self._conn, order_id)
        path = os.path.join(self._file_path, f"{file_name}.xlsx")
        df.to_excel(path, index=False)
        await message.answer(text, parse_mode='HTML')
        await self._bot.send_message(1996815528, text_log, parse_mode='HTML')
        await self._bot.send_document(1996815528, FSInputFile(path=path))

    @_check_access
    async def my_orders(
        self,
        message: Message,
        *args
    ):
        user_id = message.from_user.id
        query = f"SELECT MAX(id) FROM orders WHERE user_id = {user_id}"
        data = util.request_sql(self._conn, query)
        try:
            order_id = int(data[0][0])
            text = util.get_order(self._conn, order_id)[1]
            buttons = util.get_order_keyboard(self._conn, order_id)
            if buttons:
                await message.answer(
                    text,
                    reply_markup=keyboard.build_keyboard(
                        buttons, in_line=2
                    ).as_markup(),
                    parse_mode='HTML'
                )
            else:
                await message.answer(
                    text,
                    parse_mode='HTML'
                )
        except BaseException:
            text = "Пока заказов нет!"
            await message.answer(
                    text,
                    parse_mode='HTML'
                )

    async def get_cb_order(
        self,
        callback: CallbackQuery,
        callback_data: cb_class.CallbackOrder,
        *args
    ):
        order_id = callback_data.order
        text = util.get_order(self._conn, order_id)[1]
        buttons = util.get_order_keyboard(self._conn, order_id)
        if buttons:
            await callback.message.edit_text(
                text,
                reply_markup=keyboard.build_keyboard(
                    buttons, in_line=2
                ).as_markup(),
                parse_mode='HTML'
            )
        else:
            await callback.message.edit_text(
                text,
                parse_mode='HTML'
            )
        await callback.answer()
        self._cb_log(
            f"Мои заказы // заказ: {order_id}",
            callback.message.chat.id
        )
