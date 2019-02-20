module UserSwitcher
  class << self
    def configure
      yield config
    end

    def config
      @_config ||= Config.new
    end

    def enabled?
      !!config.enabled
    end
  end

  class Config
    attr_accessor :login_url, :login_procedure, :enabled

    def initialize
      @login_url = "/user_switcher/login"
      @users = load_users_from_file
      @login_procedure = default_login_procedure
      @enabled = if defined?(Rails)
                   Rails.env.development?
                 else
                   true
                 end
    end

    def default_login_procedure
      proc do
        # You can use params[:email] & params[:password] for login
        logout
        login(params[:email], params[:password])

        redirect_to main_app.root_path
      end
    end

    def load_users_from_file
      #
      []
    end

    def users
      @users
    end

    def users=(users)
      @users += users.map { |user| User.new(user) }
    end

    def to_middleware_config
      { users: users, login_url: login_url }
    end
  end

  User = Struct.new(:id, :password, keyword_init: true)
end
