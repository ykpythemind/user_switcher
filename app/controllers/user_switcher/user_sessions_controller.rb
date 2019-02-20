module UserSwitcher
  class UserSessionsController < ActionController::Base
    skip_before_action :verify_authenticity_token
    if defined?(Sorcery)
      skip_before_action :require_login, raise: false
    end

    before_action :prepare_login_params

    def create
      instance_eval &UserSwitcher.config.login_procedure
    end

    private

    def prepare_login_params
      user_param = (params[:users] || [{}]).find { |user| user[:id] == params[:user_id] }
      return if user_param.blank?

      params[:id] = user_param[:id]
      params[:email] = user_param[:id]
      params[:password] = user_param[:password]
    end
  end
end
