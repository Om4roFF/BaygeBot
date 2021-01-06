import time

from config import BaseModel
from peewee import *


class Lang(BaseModel):
    id = IntegerField()
    sentence = TextField()
    lang = CharField(max_length=1)

    class Meta:
        db_table = 'language'


def sentence(id, lang):
    try:
        s = Lang.select().where(Lang.id == int(id) & Lang.lang == lang ).get()
        return s.sentence
    except Exception as e:
        print(e)


def insert(id, words, lang):
    s = Lang.create(id=id, sentence=words, lang=str(lang))
    s.save()


insert(1, 'Сообщить о правонарушении', 1)
time.sleep(2)
insert(2, 'Құқық бұзушылық туралы хабарлау', 0)