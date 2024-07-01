import asyncio
from bot import TgBot


if __name__ == "__main__":
    bot = TgBot("config.yaml")
    print("run")
    asyncio.run(bot.run())
