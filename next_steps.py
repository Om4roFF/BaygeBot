from aiogram.dispatcher.filters.state import StatesGroup, State


class States(StatesGroup):
    # класс с состояниями для конечного автомата
    lang: State = State()
    reg: State = State()
    phone: State = State()
    back: State = State()
    date: State = State()
    city: State = State()
    name: State = State()
    info: State = State()
    offender: State = State()
    position: State = State()
    photo: State = State()