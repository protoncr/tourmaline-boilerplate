require "clear"

connection_pool_size = ENV.fetch("DATABASE_CONNECTION_POOL_SIZE", "20").to_i
Clear::SQL.init(ENV["DATABASE_URI"], connection_pool_size: connection_pool_size)
