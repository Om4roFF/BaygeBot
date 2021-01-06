from peewee import *
BOT_TOKEN = '1404329708:AAGRjyjMGgXqfV-oq5rkhCCwdd6cDHIheuo'


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

