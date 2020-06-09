class TelegramBot < Tourmaline::Client
  @[Command("start")]
  def start_command(ctx)
    ctx.message.respond(I18n.translate("messages.start_message"), parse_mode: :markdown)
  end
end
