require "tourmaline"
require "dotenv"

Dotenv.load? ".env"

require "./bot/config/*"
require "./bot/**"

class TelegramBot < Tourmaline::Client
  @[On(:update, group: :user_persistence)]
  def persist_users(client, update)
    Helpers.persist_users(update.users)
    Helpers.persist_chats(update.chats)
    Helpers.persist_chat_members(update)
  end
end

require "./bot/commands/**"

bot = TelegramBot.new(ENV["BOT_TOKEN"])
bot.poll
