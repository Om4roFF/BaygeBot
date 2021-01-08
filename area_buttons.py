import math
import re

from aiogram.dispatcher import FSMContext
from aiogram.types import Message, ContentType
from aiogram import types
from lang_phrases import lang_list
from main import dp, bot
from models.area_model import select_all
from models.district_model import list_of_district, select_all_district
from models.polling_station_model import list_of_stations
from models.user_model import get_lang
from next_steps import States


async def markup_cities_page1():
    list_of_areas = await select_all()
    markup = types.InlineKeyboardMarkup()
    for i in range(int(len(list_of_areas) / 2)):
        markup.add(types.InlineKeyboardButton(text=list_of_areas[i][1], callback_data=list_of_areas[i][1]))
    markup.add(types.InlineKeyboardButton(text='>>', callback_data='>>'))
    return markup


async def markup_cities_page2():
    list_of_areas = await select_all()
    markup = types.InlineKeyboardMarkup()
    for i in range(int(len(list_of_areas) / 2), len(list_of_areas)):
        markup.add(types.InlineKeyboardButton(text=list_of_areas[i][1], callback_data=list_of_areas[i][1]))
    markup.add(types.InlineKeyboardButton(text='<<', callback_data='<<'))
    return markup


async def markup_district(district):
    markup = types.InlineKeyboardMarkup()
    # if len(district) > 9:
    #     print('here')
    #     amount_of_slides = math.ceil(len(district)/9)
    #     for i in range(8):
    #         markup.add(types.InlineKeyboardButton(text=district[i][1], callback_data=district[i][1]))
    #     markup.add(types.InlineKeyboardButton(text='>>', callback_data=f'>>_{city}'))
    #     markup.add(types.InlineKeyboardButton(text='Назад', callback_data='back_'))
    #     return markup
    # else:
    for i in district:
        text = re.sub(r'\([^()]*\)', '', i[1])
        markup.add(types.InlineKeyboardButton(text=i[1], callback_data=text))

    markup.add(types.InlineKeyboardButton(text='Назад', callback_data='back_'))
    return markup


async def markup_stations():
    markup = types.InlineKeyboardMarkup()
    markup.add(types.InlineKeyboardButton('Выбрать', callback_data='choose'))
    # markup.add(types.InlineKeyboardButton(text='Назад', callback_data='back_'))
    return markup


# изменить query
@dp.callback_query_handler(lambda query: query.data)
async def area(query: types.CallbackQuery, state=FSMContext):
    print(query.data)
    chat_id = query.message.chat.id
    lang = await get_lang(query.message.chat.id)
    list_of_areas = await select_all()
    list_of_districts = await select_all_district()
    if query.data == '>>':
        markup = await markup_cities_page2()
        await bot.edit_message_text(chat_id=query.message.chat.id, text=lang_list(lang, 'area'),
                                    message_id=query.message.message_id,
                                    reply_markup=markup, parse_mode=types.ParseMode.HTML)
    if query.data == '<<':
        markup = await markup_cities_page1()
        await bot.edit_message_text(chat_id=query.message.chat.id, text=lang_list(lang, 'area'),
                                    message_id=query.message.message_id,
                                    reply_markup=markup, parse_mode=types.ParseMode.HTML)
    markup_back_btn = types.InlineKeyboardMarkup()
    markup_back_btn.add(types.InlineKeyboardButton(lang_list(lang, 'back_btn'), callback_data='back_btn'))
    if query.data == 'target_btn':
        await bot.edit_message_text(chat_id=chat_id, message_id=query.message.message_id,
                                    text=lang_list(lang, 'target'),
                                    reply_markup=markup_back_btn, parse_mode=types.ParseMode.HTML)
        await States.back.set()
    if query.data == 'no_inet_btn':
        await bot.edit_message_text(chat_id=chat_id, message_id=query.message.message_id,
                                    text=lang_list(lang, 'no_inet'),
                                    reply_markup=markup_back_btn, parse_mode=types.ParseMode.HTML)
        await States.back.set()
    if query.data == 'inform_about_choice_btn':
        await bot.edit_message_text(chat_id=chat_id, message_id=query.message.message_id,
                                    text=lang_list(lang, 'inform_about_choice'),
                                    reply_markup=markup_back_btn, parse_mode=types.ParseMode.HTML)
        await States.back.set()
    if query.data == 'violation_btn':
        await bot.edit_message_text(chat_id=chat_id, message_id=query.message.message_id,
                                    text=lang_list(lang, 'violation'),
                                    reply_markup=markup_back_btn, parse_mode=types.ParseMode.HTML)
        await States.back.set()
    if query.data == 'sos_btn':
        await bot.edit_message_text(chat_id=chat_id, message_id=query.message.message_id, text=lang_list(lang, 'sos'),
                                    reply_markup=markup_back_btn, parse_mode=types.ParseMode.HTML)
        await States.back.set()
    if query.data == 'verification_of_voters_btn':
        await bot.edit_message_text(chat_id=chat_id, message_id=query.message.message_id,
                                    text=lang_list(lang, 'verification_of_voters'),
                                    reply_markup=markup_back_btn, parse_mode=types.ParseMode.HTML)
        await States.back.set()
    if query.data == 'back_':
        markup = await markup_cities_page1()
        await bot.edit_message_text(chat_id=chat_id, message_id=query.message.message_id,
                                    text=lang_list(lang, 'area'),
                                    reply_markup=markup, parse_mode=types.ParseMode.HTML)

    for i in list_of_areas:
        if query.data == i[1]:
            if query.data == 'Вне Казахстана':
                markup = types.ReplyKeyboardMarkup(resize_keyboard=True)
                markup.add('Назад')
                await bot.delete_message(chat_id=query.message.chat.id, message_id=query.message.message_id)
                await bot.send_message(query.message.chat.id, lang_list(lang, 'station'), reply_markup=markup)
                await state.update_data(district_id=i[0])
                await States.station.set()
            else:
                district = await list_of_district(query.data)
                markup = await markup_district(district)
                await bot.edit_message_text(chat_id=query.message.chat.id, text=lang_list(lang, 'area'),
                                            message_id=query.message.message_id,
                                            reply_markup=markup, parse_mode=types.ParseMode.HTML)

    for i in list_of_districts:
        text = re.sub(r'\([^()]*\)', '', i[1])
        if query.data == text:
            markup = types.ReplyKeyboardMarkup(resize_keyboard=True)
            markup.add('Назад')
            await bot.delete_message(chat_id=query.message.chat.id, message_id=query.message.message_id)
            await bot.send_message(query.message.chat.id, lang_list(lang, 'station'), reply_markup=markup)
            await state.update_data(district_id=i[0])
            await States.station.set()

            # markup = types.ReplyKeyboardMarkup(resize_keyboard=True)
            # button1 = types.KeyboardButton('<<')
            # button2 = types.KeyboardButton('>>')
            # markup.row(button1, button2)
            # markup.add('Назад')
            # await bot.delete_message(chat_id=query.message.chat.id, message_id=query.message.message_id)
            # await bot.send_message(chat_id=query.message.chat.id, text='Выберите участок:', reply_markup=markup)
            # list_of_st = await list_of_stations(query.data)
            # markup = await markup_stations()
            # list_of_msg = []
            # for j in range(9):
            #     msg = await bot.send_message(chat_id=query.message.chat.id, text=list_of_st[j][1], reply_markup=markup)
            #     list_of_msg.append(msg.message_id)
            # await state.update_data(query=query.data)
            # await state.update_data(msg_ids=list_of_msg)


async def choose_area(message: types.Message, lang):
    markup = await markup_cities_page1()
    await bot.send_message(chat_id=message.chat.id, text=lang_list(lang, 'area'),
                           reply_markup=markup, parse_mode=types.ParseMode.HTML)
    # await bot.edit_message_text(text=lang_list(lang, 'area'))
    # await message.answer(, reply_markup=)
