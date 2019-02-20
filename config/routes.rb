Rails.application.routes.draw do
  if UserSwitcher.enabled?
    scope UserSwitcher.config.routes_prefix, module: "user_switcher" do
      post "login", to: "user_sessions#create", as: "user_switcher_login"
    end
  end
end
