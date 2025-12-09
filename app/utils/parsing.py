from app.dao.enums import Marketplace


def get_marketplace_from_url(url: str) -> Marketplace:
    if Marketplace.OZON.value in url:
        return Marketplace.OZON.value
    elif Marketplace.WILDBERRIES.value in url:
        return Marketplace.WILDBERRIES.value
    elif Marketplace.YAMARKET.value in url:
        return Marketplace.YAMARKET.value
    else:
        return None