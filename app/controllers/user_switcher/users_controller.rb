module UserSwitcher
  class UsersController < ActionController::Base
    skip_before_action :verify_authenticity_token
    before_action :prepare_login_params

    def login
      instance_eval &UserSwitcher.config.login_procedure
    end

    private

    def prepare_login_params
      user_param = params[:users].find { |param| param[:id] == params[:user_id] }
      return if user_param.blank?

      params[:id] = user_param[:id]
      params[:email] = user_param[:id]
      params[:password] = user_param[:password]
    end
  end
end
