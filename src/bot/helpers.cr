class TelegramBot < Tourmaline::Client
  module Helpers
    extend self

    def escape_markdown(text)
      ['_', '*', '`', '[', ']', '(', ')'].each do |char|
        text = text.gsub(char, "\\#{char}")
      end
      text
    end

    def escape_markdown_v2(text)
      ['_', '*', '[', ']', '(', ')', '~', '`', '>', '#', '+', '-', '=', '|', '{', '}', '.', '!'].each do |char|
        text = text.gsub(char, "\\#{char}")
      end
      text
    end

    def persist_users(users)
      users.each do |user|
        if model = Models::User.query.find({id: user.id})
          model.update!({
            first_name: user.first_name,
            last_name: user.last_name,
            username: user.username,
            language_code: user.language_code,
            updated_at: Time.utc
          })
        else
          Models::User.create!({
            id: user.id,
            first_name: user.first_name,
            last_name: user.last_name,
            username: user.username,
            language_code: user.language_code,
            is_bot: user.is_bot
          })
        end
      end
    end

    def persist_chats(chats)
      chats.each do |chat|
        if model = Models::Chat.query.find({id: chat.id})
          model.update!({
            title: chat.title,
            username: chat.username,
            first_name: chat.first_name,
            last_name: chat.last_name,
            description: chat.description,
            updated_at: Time.utc,
          })
        else
          Models::Chat.create!({
            id: chat.id,
            type: chat.type,
            title: chat.title,
            username: chat.username,
            first_name: chat.first_name,
            last_name: chat.last_name,
            description: chat.description,
          })
        end
      end
    end

    def persist_chat_members(update)
      pairs = [] of Tuple(Tourmaline::User, Tourmaline::Chat)

      # Find all User/Chat pairs
      if message = update.message
        if (from = message.from) && (chat = message.chat)
          pairs << {from, chat}
        end
      end

      pairs.each do |(user, chat)|
        if model = Models::ChatMember.query.find({chat_id: chat.id, user_id: user.id})
          model.updated_at = Time.utc
          model.save
        else
          chat_member = Tourmaline::Container.client.get_chat_member(chat, user)
          update_chat_member(chat.id, chat_member.user.id)
        end
      end
    end

    def update_chat_member(chat_id : Int64, user_id : Int64)
      user = Models::ChatMember.query.find({chat_id: chat_id, user_id: user_id})
      begin
        chat_member = Container.client.get_chat_member(chat_id, user_id)

        # Delete the chat member if they're no longer in the chat
        if ["kicked", "left"].includes?(chat_member.status)
          if user
            return user.delete
          end
        end

        user ||= Models::ChatMember.new

        user.chat_id = chat_id
        user.user_id = user_id

        user.save
      rescue ex
        if user
          user.delete
        end
      end
    end
  end
end

class String
  def parse_markdown(version = 1)
    case version
    when 0, 1
      TelegramBot::Helpers.parse_markdown(self)
    when 2
      TelegramBot::Helpers.parse_markdown_v2(self)
    else
      raise "Unknown markdown version number #{version}"
    end
  end
end
