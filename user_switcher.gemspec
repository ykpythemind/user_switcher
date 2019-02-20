$:.push File.expand_path("lib", __dir__)

require "user_switcher/version"

Gem::Specification.new do |spec|
  spec.name        = "user_switcher"
  spec.version     = UserSwitcher::VERSION
  spec.authors     = ["ykpythemind"]
  spec.email       = ["yukibukiyou@gmail.com"]
  spec.homepage    = "https://github.com/ykpythemind/user_switcher"
  spec.summary     = "Switch user easily via browser."
  spec.description = "Rails plugin for switching 'current_user'"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_development_dependency "rails", "~> 5.2.2"
  spec.add_development_dependency "sqlite3", "~> 1.3.6"
  spec.add_development_dependency "sorcery", "~> 0.13"
end
