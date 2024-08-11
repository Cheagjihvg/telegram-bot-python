# main.py

import os
from dotenv import load_dotenv
from telegram.ext import Application, CommandHandler
from commands import start, game_choice, key_count, proxy_file_path

# Load environment variables
load_dotenv()

def main() -> None:
    # Initialize Telegram bot
    token = os.getenv("TELEGRAM_BOT_TOKEN")
    application = Application.builder().token(token).build()

    # Register handlers
    application.add_handler(CommandHandler("start", start))
    application.add_handler(CommandHandler("game_choice", game_choice))
    application.add_handler(CommandHandler("key_count", key_count))
    application.add_handler(CommandHandler("proxy_file_path", proxy_file_path))

    # Run the bot
    application.run_polling()

if __name__ == '__main__':
    main()
