from config import BaseModel
from peewee import *


class Area(BaseModel):
    id = PrimaryKeyField()
    name = CharField(max_length=50)

    class Meta:
        dt_table = 'area'


async def select_all():
    areas = Area.select()
    list_of_area = list()
    for i in areas:
        l = []
        l.append(i.id)
        l.append(i.name)
        list_of_area.append(l)
    return list_of_area


async def get_area_by_id(area_name):
    area = Area.select().where(Area.name == area_name).get()
    return area.id
