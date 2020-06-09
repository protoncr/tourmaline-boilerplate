# Tourmaline Bot Boilerplate

This is a boilerplate Telegram bot for the [Tourmaline](https://tourmaline.dev) Telegram bot framework.

**Features:**
- Internationalization support using [TechMagister/i18n](https://github.com/TechMagister/i18n)
- Background job processing using [robacarp/mosquito](https://github.com/robacarp/mosquito)
- Database support using PostgreSQL, [amberframework/micrate](https://github.com/amberframework/micrate), and [anykeyh/clear](https://github.com/anykeyh/clear)
- Automatic restarts during development using [samueleaton/sentry](https://github.com/samueleaton/sentry)
- Dockerfile for easy deployments

## Usage

1. Clone the repo and cd into the created directory

    ```
    git clone https://github.com/watzon/tourmaline-boilerplate.git
    cd tourmaline-boilerplate
    ```

2. Install required shards

    ```
    shards install
    ```

3. Create and edit envorionment file

    ```
    cp .env.example .env
    ```

3. Setup and migrate the database (be sure you have configured the `DATABASE_URI` environment variable)

    ```
    ./micrate up
    ```

4. Run the bot (using sentry to watch for changes)

    ```
    crystal run ./src/sentry.cr
    ```

## Contributing

1. Fork it (<https://github.com/your-github-user/telegram_bot/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Chris Watson](https://github.com/your-github-user) - creator and maintainer
