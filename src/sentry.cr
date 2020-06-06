require "sentry"

sentry = Sentry::ProcessRunner.new(
    display_name: "Telegram Bot",
    build_command: "crystal build ./src/bot.cr",
    run_command: "./bot",
    files: ["./src/**/*.cr", "./src/bot/locales/**/*.yml"]
)

sentry.run
