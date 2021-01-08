from config import BaseModel
from peewee import *


class Users(BaseModel):
    id = PrimaryKeyField()
    phone_number = CharField(max_length=13)
    lang = CharField(max_length=2)
    name = CharField(max_length=50)

    class Meta:
        db_table = 'users'


async def add_user(chat_id, lang, phone_number=None):
    try:
        if phone_number is None:
            user = Users.create(id=chat_id, lang=lang)
            user.save()
        else:
            user = Users.create(id=chat_id, phone_number=phone_number, lang=lang)
            user.save()
    except Exception as error:
        print(error)


async def update_phone(chat_id, phone_number, name):
    try:
        user = Users.select().where(Users.id == int(chat_id)).get()
        user.phone_number = phone_number
        user.name = name
        user.save()
    except Exception as e:
        print(e)


async def is_registered(chat_id):
    try:
        user = Users.select().where(Users.id == int(chat_id)).get()
        return True
    except Exception as e:
        return False


async def is_have_phone(chat_id):
    try:
        user = Users.select().where(Users.id == int(chat_id)).get()
        if user.phone_number is not None:
            return True
        return False
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