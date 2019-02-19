require "user_switcher/config"
require "user_switcher/rack"

if defined?(Rails)
  require "user_switcher/railtie"
end
