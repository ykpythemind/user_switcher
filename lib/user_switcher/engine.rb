require "rails"

module UserSwitcher
  class Engine < ::Rails::Engine
    isolate_namespace UserSwitcher

    # initializer "user_switcher.mixins" do
    #   ActiveSupport.on_load :active_record do
    #   end
    # end

    # config.to_prepare do
    #   # init!
    # end
  end
end
