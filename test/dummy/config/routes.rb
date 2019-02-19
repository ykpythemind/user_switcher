Rails.application.routes.draw do
  # TODO: fix / dsl
  mount UserSwitcher::Engine => "/user_switcher"

  root to: "pages#index"
end
