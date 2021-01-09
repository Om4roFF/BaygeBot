from config import BaseModel
from peewee import *
from bot_logger import logger


class Area(BaseModel):
    id = PrimaryKeyField()
    name = CharField(max_length=50)

    class Meta:
        dt_table = 'area'


async def select_all():
    try:
        areas = Area.select()
        list_of_area = list()
        for i in areas:
            l = [i.id, i.name]
            list_of_area.append(l)
        return list_of_area
    except Exception as e:
        logger.error(e)


async def get_area_by_id(area_name):
    try:
        area = Area.select().where(Area.name == area_name).get()
        return area.id
    except Exception as e:
        logger.error(e)
