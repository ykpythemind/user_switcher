UserSwitcher::Engine.routes.draw do
  post "login", to: "user_sessions#create"
end
