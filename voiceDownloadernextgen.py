import os
import time
import telebot
import datetime
import requests
from config import con, BOT_TOKEN
import schedule
from models.poll_model import list_of_poll_by_status



# Определение ботов ботов
from models.violation_model import list_of_violation_by_status

bot = telebot.TeleBot(BOT_TOKEN)


def start_download():
    download_voted_photos()
    download_violation_photo()


def download_voted_photos():
    list_of_hash = list_of_poll_by_status()
    for i in list_of_hash:
        print(i.first_photo)
        file_info1 = bot.get_file(i.first_photo)
        file_info2 = bot.get_file(i.second_photo)
        uri_1 = 'https://api.telegram.org/file/bot{0}/{1}'.format(BOT_TOKEN, file_info1.file_path)
        uri_2 = 'https://api.telegram.org/file/bot{0}/{1}'.format(BOT_TOKEN, file_info2.file_path)
        try:
            r = requests.get(uri_1, stream=True)
            if r.status_code == 200:
                with open('media/' + str(i.chat_id) + '_first_photo.jpg', 'wb') as f:
                    for data in r:
                        f.write(data)

            r = requests.get(uri_2, stream=True)
            if r.status_code == 200:
                with open('media/' + str(i.chat_id) + '_second_photo.jpg', 'wb') as f:
                    for data in r:
                        f.write(data)

        except Exception as e:
            print("аудио по хэшу не доступно: " + str(e))
            pass


def download_violation_photo():
    list_of_hash = list_of_violation_by_status()
    for i in list_of_hash:
        try:
            print(i[0])
            file_info = bot.get_file(i[1])
            uri_1 = 'https://api.telegram.org/file/bot{0}/{1}'.format(BOT_TOKEN, file_info.file_path)
            print(len(i[1]))
            try:
                r = requests.get(uri_1, stream=True)
                if r.status_code == 200:
                    with open('media/' + str(i[0]) + '_' + str(i[1][40:]) + '.jpg', 'wb') as f:
                        for data in r:
                            f.write(data)
            except Exception as e:
                print("аудио по хэшу не доступно: " + str(e))
                pass

        except Exception as e:
            print(e)


schedule.every(8).hours.do(start_download)
while 1:
    schedule.run_pending()
    time.sleep(1)
 
