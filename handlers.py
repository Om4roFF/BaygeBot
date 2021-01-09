import math

from aiogram.dispatcher import FSMContext
from aiogram import types
from aiogram.types import Message

from area_buttons import markup_cities_page1, choose_area, markup_stations
from main import bot, dp
from models.poll_model import add_poll, add_photo, list_of_user_poll
from models.polling_station_model import list_of_stations
from next_steps import States
from models.user_model import is_registered, add_user, get_lang, update_lang, is_have_phone, update_phone, list_of_user, \
    count_of_reg_users
from lang_phrases import lang_list
from models.violation_model import add_viol
from bot_logger import logger

@dp.message_handler(commands=['start'])
async def welcome(message: Message, state=FSMContext):
    markup = types.InlineKeyboardMarkup()
    markup.add(types.InlineKeyboardButton(text='Рус ' + "🇷🇺", callback_data='ru'))
    markup.add(types.InlineKeyboardButton(text='Қаз ' + "🇰🇿", callback_data='kz'))
    await send_message(
        chat_id=message.chat.id,
        text='Қалаған интерфейс тілін таңдаңыз \nВыберите предпочитаемый язык интерфейса',
        reply_markup=markup)
    await States.lang.set()


@dp.callback_query_handler(state=States.lang)
async def lang_set(query: types.CallbackQuery, state=FSMContext):
    message = query.message
    lang = query.data
    if lang == 'ru':
        await state.update_data(lang=lang)
        await update_lang(message.chat.id, lang)
    elif lang == 'kz':
        await state.update_data(lang=lang)
        await update_lang(message.chat.id, lang)
    if (lang != 'ru') and (lang != 'kz'):
        markup = types.InlineKeyboardMarkup()
        markup.add(types.InlineKeyboardButton(text='Рус', callback_data='Рус'))
        markup.add(types.InlineKeyboardButton(text='Қаз', callback_data='Қаз'))
        await send_message(message.chat.id, 'Выберите одно из двух', reply_markup=markup)
        await States.lang.set()
    else:
        await state.finish()
        if await is_registered(message.chat.id):
            await main_menu(message, lang)
        else:
            await add_user(message.chat.id, lang)
            markup = await reg_buttons(lang)
            await send_message(message.chat.id, lang_list(lang, 'start'), reply_markup=markup)
            # await States.reg.set()


async def reg_buttons(lang):
    markup = types.ReplyKeyboardMarkup(resize_keyboard=True, one_time_keyboard=True)
    button1 = types.KeyboardButton(lang_list(lang, 'registration'), request_contact=True)
    button2 = types.KeyboardButton(lang_list(lang, 'instruction_btn'))
    button3 = types.KeyboardButton(lang_list(lang, 'switch_btn'))
    markup.row(button1)
    markup.row(button2, button3)
    return markup


@dp.message_handler(state=States.reg)
async def registration_step(message: Message, state=FSMContext):
    markup = types.ReplyKeyboardMarkup(resize_keyboard=True)
    markup.add(types.KeyboardButton(text='Share contact', request_contact=True))
    await send_message(chat_id=message.chat.id, text='sss', reply_markup=markup)
    await States.phone.set()


@dp.message_handler(content_types=['contact'])
async def phone_save(message: Message, state=FSMContext):
    try:
        lang = await get_lang(message.chat.id)
        await update_phone(message.contact.user_id, message.contact.phone_number, message.contact.first_name)
        await state.finish()
        await main_menu(message, lang)
    except Exception as e:
        logger.error(e)


@dp.message_handler(state=States.station)
async def station_set(message: Message, state=FSMContext):
    try:
        lang = await get_lang(message.chat.id)
        if message.text == 'Назад':
            await state.finish()
            await main_menu(message, lang)
        else:
            data = await state.get_data()
            district_id = data.get('district_id')
            await add_poll(message.chat.id, district_id, message.text)
            await send_message(message.chat.id, lang_list(lang, 'ty_for_choose'))
            await state.finish()
            await main_menu(message, lang)
    except Exception as e:
        logger.error(e)


@dp.message_handler(commands='stat', content_types=types.ContentTypes.TEXT)
async def send_stat(message: Message, state=FSMContext):
    print(message.text)
    try:
        users_count = await list_of_user()
        reg_count = await count_of_reg_users()
        poll_count = await list_of_user_poll()
        await message.answer('Общее количество пользователей: ' + str(users_count) + '\n\n'
                             + 'Зарегистрированных пользователей: ' + str(reg_count) + '\n\n'
                             + 'Количество избирателей: ' + str(poll_count))
    except Exception as e:
        logger.error(e)


async def main_menu(message: Message, lang, state=FSMContext):
    markup = types.ReplyKeyboardMarkup(resize_keyboard=True, row_width=4)
    button1 = types.KeyboardButton(lang_list(lang, 'report_btn'))
    # button2 = types.KeyboardButton(lang_list(lang, 'verification_btn'))
    button3 = types.KeyboardButton(lang_list(lang, 'instruction_btn'))
    button4 = types.KeyboardButton(lang_list(lang, 'switch_btn'))
    button5 = types.KeyboardButton(lang_list(lang, 'area_btn'))
    button2 = types.KeyboardButton(lang_list(lang, 'vote_btn'))
    markup.row(button1, button2)
    markup.row(button3, button4)
    markup.row(button5)
    await message.answer(lang_list(lang, 'menu'), reply_markup=markup)


@dp.message_handler(content_types=types.ContentTypes.TEXT)
async def commands(message: Message, state=FSMContext):
    try:

        print(message.text)
        lang = await get_lang(chat_id=message.chat.id)
        if message.text == lang_list(lang, 'report_btn'):
            await report_violation(message, lang)
        if message.text == lang_list(lang, 'instruction_btn'):
            await instruction(message, lang)
        if message.text == lang_list(lang, 'switch_btn'):
            if lang == 'ru':
                lang = 'kz'
            else:
                lang = 'ru'
            if await is_have_phone(message.chat.id):
                await update_lang(message.chat.id, lang)
                await main_menu(message, lang)
            else:
                await update_lang(message.chat.id, lang)
                markup = await reg_buttons(lang)
                await send_message(message.chat.id, lang_list(lang, 'start'), reply_markup=markup)
        if message.text == lang_list(lang, 'verification_btn'):
            await send_message(message.chat.id, 'verification')
        if message.text == lang_list(lang, 'vote_btn'):
            markup = types.ReplyKeyboardMarkup(resize_keyboard=True)
            markup.add(lang_list(lang, 'back_btn'))
            await state.update_data(lang=lang)
            await send_message(message.chat.id, lang_list(lang, 'voted_photo'), reply_markup=markup)
            await States.vote.set()
        if message.text == lang_list(lang, 'area_btn'):
            await choose_area(message, lang)
        if message.text == '>>' or message.text == '<<' or message.text == 'Назад':
            await slider(message, state, lang)
    except Exception as e:
        logger.error(e)


async def slider(message, state, lang):
    data = await state.get_data()
    msg_ids = data.get('msg_ids')
    query = data.get('query')
    amount = data.get('amount')
    list_of_msg = []
    list_of_st = await list_of_stations(query)
    if message.text == '>>':
        for i in msg_ids:
            await bot.delete_message(message.chat.id, i)

        await bot.delete_message(message.chat.id, message.message_id)
        amount_of_slides = math.ceil(len(list_of_st) / 9)
        from_ = 9
        to_ = 18
        if amount is not None:
            from_ = amount * 9
            to_ = from_ + 9

        await state.update_data(amount=int(to_ / 9))
        markup = await markup_stations()
        for i in range(from_, to_):
            msg = await message.answer(text=list_of_st[i][1], reply_markup=markup, parse_mode=types.ParseMode.HTML)
            list_of_msg.append(msg.message_id)
        await state.update_data(msg_ids=list_of_msg)
    if message.text == '<<':
        if amount is None:
            pass
        else:
            to_ = amount * 9
            from_ = to_ - 9
            await state.update_data(amount=int(from_ / 9))
            markup = await markup_stations()
            for i in range(from_, to_):
                msg = await message.answer(text=list_of_st[i][1], reply_markup=markup, parse_mode=types.ParseMode.HTML)
                list_of_msg.append(msg.message_id)
            await state.update_data(msg_ids=list_of_msg)
    if message.text == 'Назад':
        for i in msg_ids:
            await bot.delete_message(message.chat.id, i)
        markup = await markup_cities_page1()
        await bot.send_message(chat_id=message.chat.id, text=lang_list(lang, 'area'),
                               reply_markup=markup, parse_mode=types.ParseMode.HTML)
        await bot.delete_message(message.chat.id, message.message_id)
        await main_menu(message, lang)


@dp.message_handler(content_types=['photo', 'text'], state=States.vote)
async def vote(message: Message, state=FSMContext):
    try:
        data = await state.get_data()
        lang = data.get('lang')
        number = data.get('number')
        if message.text == lang_list(lang, 'back_btn'):
            await state.finish()
            await main_menu(message, lang)
        elif message.photo:
            if number is None:
                await add_photo(message.chat.id, message.photo[1].file_id, 1)
                await state.update_data(number=2)
                await States.vote.set()
            elif number == 2:
                await add_photo(message.chat.id, message.photo[1].file_id, 2)
                await state.finish()
                await send_message(message.chat.id, lang_list(lang, 'ty_for_vote'))
                await main_menu(message, lang)
        else:
            markup = types.ReplyKeyboardMarkup(resize_keyboard=True)
            markup.add(lang_list(lang, 'back_btn'))
            await send_message(message.chat.id, lang_list(lang, 'voted_photo'), reply_markup=markup)
            await States.vote.set()
    except Exception as e:
        logger.error(e)


async def report_violation(message: Message, lang, state=FSMContext):
    markup = await violation_markup(lang)
    await send_message(message.chat.id, lang_list(lang, 'violation_date'), markup)
    await States.date.set()


async def violation_markup(lang):
    markup = types.ReplyKeyboardMarkup(resize_keyboard=True)
    skip = types.KeyboardButton(lang_list(lang, 'skip'))
    back = types.KeyboardButton(lang_list(lang, 'back_btn'))
    markup.row(back, skip)
    return markup


@dp.message_handler(state=States.date, content_types=['text'])
async def violation_date(message: Message, state=FSMContext):
    try:
        date = message.text
        lang = await get_lang(message.chat.id)
        if message.text == lang_list(lang, 'back_btn'):
            await state.finish()
            await main_menu(message, lang)
        else:
            if message.text == lang_list(lang, 'skip'):
                date = None
            await state.update_data(lang=lang)
            await state.update_data(date=date)
            markup = await violation_markup(lang)
            await send_message(message.chat.id, lang_list(lang, 'violation_city'), markup)
            await States.city.set()
    except Exception as e:
        logger.error(e)


@dp.message_handler(state=States.city, content_types=['text'])
async def violation_city(message: Message, state=FSMContext):
    try:
        city = message.text
        data = await state.get_data()
        lang = data.get('lang')
        if message.text == lang_list(lang, 'back_btn'):
            await state.finish()
            await main_menu(message, lang)
        else:
            if message.text == lang_list(lang, 'skip'):
                city = None
            await state.update_data(city=city)
            markup = await violation_markup(lang)
            await send_message(message.chat.id, lang_list(lang, 'violation_name_victim'), markup)
            await States.name.set()
    except Exception as e:
        logger.error(e)


@dp.message_handler(state=States.name, content_types=['text'])
async def violation_name(message: Message, state=FSMContext):
    try:
        name = message.text
        data = await state.get_data()
        lang = data.get('lang')
        if message.text == lang_list(lang, 'back_btn'):
            await state.finish()
            await main_menu(message, lang)
        else:
            if message.text == lang_list(lang, 'skip'):
                name = None
            await state.update_data(name=name)
            markup = await violation_markup(lang)
            await send_message(message.chat.id, lang_list(lang, 'violation_about'), markup)
            await States.info.set()
    except Exception as e:
        print(e)
        logger.error(e)


@dp.message_handler(state=States.info, content_types=['text'])
async def violation_info(message: Message, state=FSMContext):
    try:

        info = message.text
        data = await state.get_data()
        lang = data.get('lang')
        if message.text == lang_list(lang, 'back_btn'):
            await state.finish()
            await main_menu(message, lang)
        else:
            if message.text == lang_list(lang, 'skip'):
                info = None
            await state.update_data(info=info)
            markup = await violation_markup(lang)
            await send_message(message.chat.id, lang_list(lang, 'violation_name_offender'), markup)
            await States.offender.set()
    except Exception as e:
        logger.error(e)


@dp.message_handler(state=States.offender, content_types=['text'])
async def violation_offender(message: Message, state=FSMContext):
    try:
        offender = message.text
        data = await state.get_data()
        lang = data.get('lang')
        if message.text == lang_list(lang, 'back_btn'):
            await state.finish()
            await main_menu(message, lang)
        else:
            if message.text == lang_list(lang, 'skip'):
                offender = None
            await state.update_data(offender=offender)
            markup = await violation_markup(lang)
            await send_message(message.chat.id, lang_list(lang, 'violation_position'), markup)
            await States.position.set()
    except Exception as e:
        logger.error(e)


@dp.message_handler(state=States.position, content_types=['text'])
async def violation_position(message: Message, state=FSMContext):
    try:
        position = message.text
        data = await state.get_data()
        lang = data.get('lang')
        if message.text == lang_list(lang, 'back_btn'):
            await state.finish()
            await main_menu(message, lang)
        else:
            if message.text == lang_list(lang, 'skip'):
                position = None
            await state.update_data(position=position)
            markup = await violation_markup(lang)
            await send_message(message.chat.id, lang_list(lang, 'violation_photo'), markup)
            await States.photo.set()
    except Exception as e:
        print(e)
        logger.error(e)


@dp.message_handler(state=States.photo, content_types=['photo', 'video', 'text'])
async def violation_photo(message: Message, state=FSMContext):
    try:
        data = await state.get_data()
        lang = data.get('lang')
        photo = None
        if message.text == lang_list(lang, 'back_btn'):
            await state.finish()
            await main_menu(message, lang)
        elif message.text == lang_list(lang, 'skip') or not message.text:
            if message.photo:
                photo = message.photo[1].file_id
            if message.video:
                photo = message.video.file_id
            await add_viol(data.get('date'), data.get('city'), data.get('name'), data.get('info'), data.get('offender'),
                           data.get('position'), photo, message.chat.id)
            await send_message(message.chat.id, lang_list(lang, 'violation_completed'))
            await main_menu(message, lang)
            await state.finish()
        else:
            await send_message(message.chat.id, lang_list(lang, 'violation_photo'))
            await States.photo.set()
    except Exception as e:
        print(e)
        logger.error(e)


async def instruction(message: Message, lang):
    markup = types.InlineKeyboardMarkup()
    markup.add(types.InlineKeyboardButton(text=lang_list(lang, 'target_btn'), callback_data='target_btn'))
    markup.add(types.InlineKeyboardButton(text=lang_list(lang, 'no_inet_btn'), callback_data='no_inet_btn'))
    markup.add(types.InlineKeyboardButton(text=lang_list(lang, 'inform_about_choice_btn'),
                                          callback_data='inform_about_choice_btn'))
    markup.add(types.InlineKeyboardButton(text=lang_list(lang, 'violation_btn'), callback_data='violation_btn'))
    markup.add(types.InlineKeyboardButton(text=lang_list(lang, 'sos_btn'), callback_data='sos_btn'))
    markup.add(types.InlineKeyboardButton(text=lang_list(lang, 'verification_of_voters_btn'),
                                          callback_data='verification_of_voters_btn'))
    await send_message(chat_id=message.chat.id, text=lang_list(lang, 'for_voters'), reply_markup=markup)


# @dp.callback_query_handler(lambda query: query.data == 'target_btn')
# async def instruct_callback(query: types.CallbackQuery):
#     chat_id = query.message.chat.id
#     markup = types.InlineKeyboardMarkup()
#     lang = await get_lang(chat_id)
#     markup.add(types.InlineKeyboardButton(lang_list(lang, 'back_btn'), callback_data='back_btn'))
#     if query.data == 'target_btn':
#         await bot.edit_message_text(chat_id=chat_id, message_id=query.message.message_id,
#                                     text=lang_list(lang, 'target'),
#                                     reply_markup=markup, parse_mode=types.ParseMode.HTML)
#         await States.back.set()
#     if query.data == 'no_inet_btn':
#         await bot.edit_message_text(chat_id=chat_id, message_id=query.message.message_id,
#                                     text=lang_list(lang, 'no_inet'),
#                                     reply_markup=markup, parse_mode=types.ParseMode.HTML)
#         await States.back.set()
#     if query.data == 'inform_about_choice_btn':
#         await bot.edit_message_text(chat_id=chat_id, message_id=query.message.message_id,
#                                     text=lang_list(lang, 'inform_about_choice'),
#                                     reply_markup=markup, parse_mode=types.ParseMode.HTML)
#         await States.back.set()
#     if query.data == 'violation_btn':
#         await bot.edit_message_text(chat_id=chat_id, message_id=query.message.message_id,
#                                     text=lang_list(lang, 'violation'),
#                                     reply_markup=markup, parse_mode=types.ParseMode.HTML)
#         await States.back.set()
#     if query.data == 'sos_btn':
#         await bot.edit_message_text(chat_id=chat_id, message_id=query.message.message_id, text=lang_list(lang, 'sos'),
#                                     reply_markup=markup, parse_mode=types.ParseMode.HTML)
#         await States.back.set()
#     if query.data == 'verification_of_voters_btn':
#         await bot.edit_message_text(chat_id=chat_id, message_id=query.message.message_id,
#                                     text=lang_list(lang, 'verification_of_voters'),
#                                     reply_markup=markup, parse_mode=types.ParseMode.HTML)
#         await States.back.set()


@dp.callback_query_handler(state=States.back)
async def back_btn(query: types.CallbackQuery, state=FSMContext):
    if query.data == 'back_btn':
        await bot.delete_message(query.message.chat.id, query.message.message_id)
        lang = await get_lang(query.message.chat.id)
        await state.finish()
        await instruction(query.message, lang)


async def send_message(chat_id, text=None, reply_markup=None):
    await bot.send_message(chat_id, text, reply_markup=reply_markup, parse_mode=types.ParseMode.HTML)
