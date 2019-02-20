module UserSwitcher
  def self.initialize!(app)
    return if !UserSwitcher.enabled?

    app.middleware.insert(-1, UserSwitcher::Middlewares::SwitcherInserter, UserSwitcher.config.to_middleware_config)
  end

  class Railtie < ::Rails::Railtie
    initializer "user_switcher.configure_rails_initialization", after: :load_config_initializers do |app|
      UserSwitcher.initialize!(app)
    end
  end
end
