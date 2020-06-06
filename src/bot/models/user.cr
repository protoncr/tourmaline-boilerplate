class TelegramBot < Tourmaline::Client
  module Models
    class User
      include Clear::Model

      self.table = "users"

      column id : Int64, primary: true
      column first_name : String
      column last_name : String?
      column username : String?
      column language_code : String?
      column is_bot : Bool = false

      has_many memberships : ChatMember, foreign_key: "user_id"

      timestamps

      def to_tg
        Tourmaline::User.from_json(to_json)
      end

      def from_tg(user)
        from_json(user.to_json)
      end
    end
  end
end
