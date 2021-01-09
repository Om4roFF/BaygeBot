import re

from peewee import *

from bot_logger import logger
from config import BaseModel
from models.area_model import get_area_by_id


class District(BaseModel):
    id = PrimaryKeyField()
    district_name = TextField()
    area_id = IntegerField()

    class Meta:
        db_table = 'district'


def add_district(l: list, area_id: int):
    try:
        for i in l:
            dist = District.create(district_name=i, area_id=area_id)
            dist.save()
    except Exception as e:
        logger.error(e)


async def list_of_district(area_name):
    try:
        l = []
        area_id = await get_area_by_id(area_name)
        dist = District.select().where(District.area_id == area_id)
        for i in dist:
            s = [i.id, i.district_name]
            l.append(s)
        return l
    except Exception as e:
        logger.error(e)


async def get_district_id(district_name):
    try:
        area = District.select().where(District.district_name.contains(district_name)).get()
        return area.id
    except Exception as e:
        logger.error(e)


async def select_all_district():
    try:
        areas = District.select()
        list_of_districts = list()
        for i in areas:
            l = [i.id, i.district_name]
            list_of_districts.append(l)
        return list_of_districts
    except Exception as e:
        logger.error(e)

