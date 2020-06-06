Log.setup_from_env(level: ENV.fetch("LOG_LEVEL", "INFO"), sources: ENV.fetch("LOG_SOURCES", "*"))
