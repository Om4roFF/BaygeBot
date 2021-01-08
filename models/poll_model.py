from peewee import *
from config import BaseModel


class Poll(BaseModel):
    chat_id = PrimaryKeyField()
    district_id = IntegerField()
    station = TextField()
    first_photo = TextField()
    second_photo = TextField()
    status = IntegerField()

    class Meta:
        db_table = 'poll'


async def add_poll(chat_id, district_id, station):
    try:
        poll = Poll.select().where(Poll.chat_id == chat_id).get()
        poll.district_id = district_id
        poll.station = station
        poll.save()
    except Exception as e:
        poll = Poll.create(chat_id=chat_id, district_id=district_id, station=station)
        poll.save()
        print(e)


async def add_photo(chat_id, photo, number):
    try:
        poll = Poll.select().where(Poll.chat_id == chat_id).get()
        if number == 1:
            poll.first_photo = photo
        if number == 2:
            poll.second_photo = photo
        poll.save()
    except Exception as e:
        poll = Poll.create(chat_id=chat_id)
        poll.save()
        print(e)


def list_of_poll_by_status():
    try:
        poll = Poll.select().where(Poll.status == 0)
        return poll
    except Exception as e:
        print(e)





