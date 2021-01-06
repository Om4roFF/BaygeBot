from aiogram.dispatcher import FSMContext
from aiogram import types
from aiogram.types import Message, ContentType
from aiogram.utils.callback_data import CallbackData

from main import bot, dp
from next_steps import States
from user_model import is_registered, add_user, get_lang, update_lang
from lang_phrases import lang_list


@dp.message_handler(commands=['start'])
async def welcome(message: Message, state=FSMContext):
    markup = types.InlineKeyboardMarkup()
    markup.add(types.InlineKeyboardButton(text='Рус ' + "🇷🇺", callback_data='ru'))
    markup.add(types.InlineKeyboardButton(text='Қаз ' + "🇰🇿", callback_data='kz'))
    await send_message(
        chat_id=message.chat.id,
        text=' Қалаған интерфейс тілін таңдаңыз \n Выберите предпочитаемый язык интерфейса',
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
        if await is_registered(message.chat.id):
            await state.finish()
            await main_menu(message, lang)
        else:
            markup = types.ReplyKeyboardMarkup(resize_keyboard=True, one_time_keyboard=True)
            markup.add('Регистрация')
            await send_message(message.chat.id, 'registration', reply_markup=markup)
            await States.reg.set()


@dp.message_handler(state=States.reg)
async def registration_step(message: Message, state=FSMContext):
    markup = types.ReplyKeyboardMarkup(resize_keyboard=True)
    markup.add(types.KeyboardButton(text='Share contact', request_contact=True))
    await send_message(chat_id=message.chat.id, text='sss', reply_markup=markup)
    await States.phone.set()


@dp.message_handler(content_types=['contact'], state=States.phone)
async def phone_save(message: Message, state=FSMContext):
    data = await state.get_data()
    lang = data.get('lang')
    await add_user(message.contact.phone_number, message.contact.user_id, lang)
    await state.finish()
    await main_menu(message, lang)


async def main_menu(message: Message, lang, state=FSMContext):
    markup = types.ReplyKeyboardMarkup(resize_keyboard=True, row_width=4)
    button1 = types.KeyboardButton(lang_list(lang, 'report_btn'))
    button2 = types.KeyboardButton(lang_list(lang, 'verification_btn'))
    button3 = types.KeyboardButton(lang_list(lang, 'instruction_btn'))
    button4 = types.KeyboardButton(lang_list(lang, 'switch_btn'))
    markup.row(button1, button2)
    markup.row(button3, button4)
    await message.answer(lang_list(lang, 'menu'), reply_markup=markup)


@dp.message_handler(content_types=types.ContentTypes.TEXT)
async def commands(message: Message):
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
        await update_lang(message.chat.id, lang)
        await main_menu(message, lang)
    if message.text == lang_list(lang, 'verification_btn'):
        print('verification')


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


@dp.message_handler(state=States.city, content_types=['text'])
async def violation_city(message: Message, state=FSMContext):
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


@dp.message_handler(state=States.name, content_types=['text'])
async def violation_name(message: Message, state=FSMContext):
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


@dp.message_handler(state=States.info, content_types=['text'])
async def violation_info(message: Message, state=FSMContext):
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


@dp.message_handler(state=States.offender, content_types=['text'])
async def violation_offender(message: Message, state=FSMContext):
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


@dp.message_handler(state=States.position, content_types=['text'])
async def violation_position(message: Message, state=FSMContext):
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


@dp.message_handler(state=States.photo, content_types=['photo', 'video', 'text'])
async def violation_photo(message: Message, state=FSMContext):
    print(message.text)
    data = await state.get_data()
    lang = data.get('lang')
    photo = None
    if message.text == lang_list(lang, 'back_btn'):
        await state.finish()
        await main_menu(message, lang)
    elif message.text == lang_list(lang, 'skip'):
        photo = None
        await send_message(message.chat.id, lang_list(lang, 'violation_completed'))
        await main_menu(message, lang)
        await state.finish()
    elif not message.text:
        if message.photo:
            photo = message.photo[0].file_id
        if message.video:
            photo = message.video.file_id
    else:
        await send_message(message.chat.id, lang_list(lang, 'violation_photo'))
        await States.photo.set()






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


@dp.callback_query_handler()
async def instruct_callback(query: types.CallbackQuery):
    chat_id = query.message.chat.id
    markup = types.InlineKeyboardMarkup()
    lang = await get_lang(chat_id)
    markup.add(types.InlineKeyboardButton(lang_list(lang, 'back_btn'), callback_data='back_btn'))
    if query.data == 'target_btn':
        await bot.edit_message_text(chat_id=chat_id, message_id=query.message.message_id,
                                    text=lang_list(lang, 'target'),
                                    reply_markup=markup, parse_mode=types.ParseMode.HTML)
        await States.back.set()
    if query.data == 'no_inet_btn':
        await bot.edit_message_text(chat_id=chat_id, message_id=query.message.message_id,
                                    text=lang_list(lang, 'no_inet'),
                                    reply_markup=markup, parse_mode=types.ParseMode.HTML)
        await States.back.set()
    if query.data == 'inform_about_choice_btn':
        await bot.edit_message_text(chat_id=chat_id, message_id=query.message.message_id,
                                    text=lang_list(lang, 'inform_about_choice'),
                                    reply_markup=markup, parse_mode=types.ParseMode.HTML)
        await States.back.set()
    if query.data == 'violation_btn':
        await bot.edit_message_text(chat_id=chat_id, message_id=query.message.message_id,
                                    text=lang_list(lang, 'violation'),
                                    reply_markup=markup, parse_mode=types.ParseMode.HTML)
        await States.back.set()
    if query.data == 'sos_btn':
        await bot.edit_message_text(chat_id=chat_id, message_id=query.message.message_id, text=lang_list(lang, 'sos'),
                                    reply_markup=markup, parse_mode=types.ParseMode.HTML)
        await States.back.set()
    if query.data == 'verification_of_voters_btn':
        await bot.edit_message_text(chat_id=chat_id, message_id=query.message.message_id,
                                    text=lang_list(lang, 'verification_of_voters'),
                                    reply_markup=markup, parse_mode=types.ParseMode.HTML)
        await States.back.set()


@dp.callback_query_handler(state=States.back)
async def back_btn(query: types.CallbackQuery, state=FSMContext):
    if query.data == 'back_btn':
        await bot.delete_message(query.message.chat.id, query.message.message_id)
        lang = await get_lang(query.message.chat.id)
        await state.finish()
        await instruction(query.message, lang)


async def send_message(chat_id, text=None, reply_markup=None):
    await bot.send_message(chat_id, text, reply_markup=reply_markup, parse_mode=types.ParseMode.HTML)
