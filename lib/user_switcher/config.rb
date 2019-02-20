module UserSwitcher
  class << self
    def configure
      yield config
    end

    def config
      @_config ||= Config.new
    end
  end

  class Config
    attr_accessor :login_url, :login_procedure

    def initialize
      @login_url = "/user_switcher/login"
      @users = load_users
      @login_procedure = default_login_procedure
    end

    def default_login_procedure
      proc do
        # You can use params[:email] & params[:password] for login
        puts params

        redirect_to main_app.root_path
      end
    end

    def load_users
      # do something
      []
    end

    def users
      @users
    end

    def users=(users)
      @users += users.map { |user| User.new(user) }
    end
  end

  User = Struct.new(:id, :password, keyword_init: true)
end
