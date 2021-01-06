import asyncio
from aiogram import Dispatcher, Bot, executor, types
from config import BOT_TOKEN
from aiogram.contrib.fsm_storage.memory import MemoryStorage

from middlewares.ThrottlingMiddleware import ThrottlingMiddleware

loop = asyncio.get_event_loop()
bot = Bot(BOT_TOKEN, parse_mode=types.ParseMode.HTML)
dp = Dispatcher(bot, loop=loop, storage=MemoryStorage())


if __name__ == "__main__":
    from handlers import dp
    dp.middleware.setup(ThrottlingMiddleware())
    executor.start_polling(dp, skip_updates=True)
