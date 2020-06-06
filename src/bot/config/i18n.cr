require "i18n"

# Remove this if you don't want locales embedded in the binary
I18n::Backend::Yaml.embed(["src/bot/locales"])

I18n.load_path += ["src/bot/locales/**/*"]
I18n.init
I18n.default_locale = "en"
