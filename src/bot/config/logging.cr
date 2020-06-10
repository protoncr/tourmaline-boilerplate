Log.setup do |c|
  backend = Tourmaline::Logger::Backend

  c.bind "mosquito", :info, backend
  c.bind "mosquito.*", :warning, backend
  c.bind "tourmaline.*", :info, backend
end
