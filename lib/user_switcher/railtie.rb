module UserSwitcher
  def self.initialize!(app)
    app.middleware.insert(-1, UserSwitcher::Middlewares::SwitcherInserter)
  end

  class Railtie < ::Rails::Railtie
    initializer "user_switcher.configure_rails_initialization" do |app|
      UserSwitcher.initialize!(app)
    end
  end
end
