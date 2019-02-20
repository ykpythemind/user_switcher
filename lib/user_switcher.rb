require "user_switcher/config"
require "user_switcher/middlewares/switcher_inserter"

if defined?(Rails)
  require "user_switcher/engine"
  require "user_switcher/railtie"
end
