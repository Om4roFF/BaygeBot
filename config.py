from peewee import *
BOT_TOKEN = '1531073094:AAEfPju00sRHqV40sdjFCBDXEh5PAIpy-Hs'


con = PostgresqlDatabase(
        database="chat_bot",
        user="postgres",
        password="jango",
        host="127.0.0.1",
        port="5433"
)
print(con.database)


class BaseModel(Model):
    class Meta:
        database = con

