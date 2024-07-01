from aiogram.filters.callback_data import CallbackData


class CallbackDownload(CallbackData, prefix="d"):
    type: str


class CallbackShowLeftovers(CallbackData, prefix="sl"):
    msg: str


class CallbackChooseWarehouse(CallbackData, prefix="w"):
    warehouse: str


class CallbackChooseCat(CallbackData, prefix="c"):
    warehouse: str
    category: str


class CallbackChooseSubCat(CallbackData, prefix="s"):
    warehouse: str
    category: str
    subcategory: str


class CallbackShowProduction(CallbackData, prefix="sp"):
    msg: str


class CallbackShowProductionDays(CallbackData, prefix="spd"):
    msg: str


class CallbackChooseM(CallbackData, prefix="m"):
    month: str


class CallbackChooseWorkShop(CallbackData, prefix="ws"):
    month: str
    workshop: str


class CallbackChooseCatProd(CallbackData, prefix="sp"):
    month: str
    workshop: str
    category: str


class CallbackOrder(CallbackData, prefix="order"):
    order: str
