import re
from peewee import *
from config import BaseModel
from models.district_model import get_district_id


class Poll_station(BaseModel):
    id = PrimaryKeyField()
    station_info = TextField()
    district_id = IntegerField()

    class Meta:
        db_table = 'polling_station'


async def list_of_stations(district_name):
    l = list()
    district_id = await get_district_id(district_name)
    station = Poll_station.select().where(Poll_station.district_id == district_id)
    for i in station:
        temp_list = []
        temp_list.append(i.id)
        temp_list.append(i.station_info)
        l.append(temp_list)
    return l




