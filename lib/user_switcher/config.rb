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
      @login_url = "/_user_switcher/login"
      @users = load_users
      @login_procedure = nil
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
