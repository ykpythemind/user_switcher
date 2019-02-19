module UserSwitcher
  class UsersController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def login
      instance_eval &UserSwitcher.config.login_procedure
    end
  end
end
