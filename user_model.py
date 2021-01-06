from config import BaseModel
from peewee import *


class Users(BaseModel):
    id = PrimaryKeyField()
    phone_number = CharField(max_length=13)
    lang = CharField(max_length=2)

    class Meta:
        db_table = 'users'


async def add_user(phone_number, chat_id, lang):
    try:
        user = Users.create(id=chat_id, phone_number=phone_number, lang=lang)
        user.save()
    except Exception as error:
        print(error)


async def is_registered(chat_id):
    try:
        user = Users.select().where(Users.id == int(chat_id)).get()
        print(user.id)
        return True
    except Exception as e:
        return False


async def get_lang(chat_id):
    try:
        user = Users.select().where(Users.id == int(chat_id)).get()
        return user.lang
    except Exception as e:
        print(e)


async def update_lang(chat_id, lang):
    try:
        user = Users.select().where(Users.id == int(chat_id)).get()
        user.lang = lang
        user.save()
    except Exception as e:
        print(e)


# is_registered(877012379)