class TelegramBot < Tourmaline::Client
  module Models
    class ChatMember
      include Clear::Model

      self.table = "chat_members"

      column id : Int64, primary: true, presence: false

      belongs_to chat : Chat
      belongs_to user : User

      timestamps

      def to_tg
        Tourmaline::ChatMember.from_json(to_json)
      end

      def from_tg(chat_member)
        from_json(chat_member.to_json)
      end
    end
  end
end
