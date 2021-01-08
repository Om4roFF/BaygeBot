from config import BaseModel
from peewee import *


class Violation(BaseModel):
    id = PrimaryKeyField()
    date = TextField()
    city = TextField()
    name_victim = TextField()
    info = TextField()
    offender = TextField()
    position = TextField()
    photo = TextField()
    chat_id = BigIntegerField()
    status = IntegerField()

    class Meta:
        db_table = 'violation'


async def add_viol(date, city, name_victim, info, offender, position, photo, chat_id):
    try:
        vio = Violation.create(date=date, city=city, name_victim=name_victim, info=info, offender=offender,
                               position=position, photo=photo, chat_id=chat_id)
        vio.save()
    except Exception as e:
        print(e)


def list_of_violation_by_status():
    try:
        l = []
        poll = Violation.select().where(Violation.status == 0)
        for i in poll:
            if i.photo is not None:
                s = [i.chat_id, i.photo]
                l.append(s)
        return l

    except Exception as e:
        print(e)
