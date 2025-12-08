from aiogram.utils.keyboard import InlineKeyboardBuilder, InlineKeyboardButton, InlineKeyboardMarkup

from app.dao.enums import ProductAddAttrs

def enter_product_menu_kb() -> InlineKeyboardMarkup:
    kb = InlineKeyboardBuilder()
    kb.row(
        InlineKeyboardButton(text="❌ Название", callback_data=ProductAddAttrs.NAME.value),
        InlineKeyboardButton(text="❌ Цена", callback_data=ProductAddAttrs.PRICE.value),
        InlineKeyboardButton(text="❌ Приоритет", callback_data=ProductAddAttrs.PRIORITY.value),
    )
    kb.row(
        InlineKeyboardButton(text="🔙 Отмена", callback_data="product_cancel")
    )
    return kb.as_markup()