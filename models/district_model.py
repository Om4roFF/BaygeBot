import re

from peewee import *
from config import BaseModel
from models.area_model import get_area_by_id


class District(BaseModel):
    id = PrimaryKeyField()
    district_name = TextField()
    area_id = IntegerField()

    class Meta:
        db_table = 'district'


def add_district(l: list, area_id: int):
    for i in l:
        dist = District.create(district_name=i, area_id=area_id)
        dist.save()


async def list_of_district(area_name):
    l = []
    area_id = await get_area_by_id(area_name)
    dist = District.select().where(District.area_id == area_id)
    for i in dist:
        s = []
        s.append(i.id)
        s.append(i.district_name)
        l.append(s)
    return l


async def get_district_id(district_name):
    area = District.select().where(District.district_name.contains(district_name)).get()
    return area.id


async def select_all_district():
    areas = District.select()
    list_of_districts = list()
    for i in areas:
        l = []
        l.append(i.id)
        l.append(i.district_name)
        list_of_districts.append(l)
    return list_of_districts

