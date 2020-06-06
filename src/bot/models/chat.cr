class TelegramBot < Tourmaline::Client
  module Models
    class Chat
      include Clear::Model

      self.table = "chats"

      column id : Int64, primary: true
      column type : String
      column title : String?
      column username : String?
      column first_name : String?
      column last_name : String?
      column description : String?

      has_many members : ChatMember, foreign_key: "chat_id"

      timestamps

      def to_tg
        Tourmaline::Chat.from_json(to_json)
      end

      def from_tg(chat)
        from_json(chat.to_json)
      end
    end
  end
end
