$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "user_switcher/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "user_switcher"
  spec.version     = UserSwitcher::VERSION
  spec.authors     = ["Yukito Ito"]
  spec.email       = ["yukibukiyou@gmail.com"]
  spec.homepage    = ""
  spec.summary     = "Summary of UserSwitcher."
  spec.description = "Description of UserSwitcher."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  # spec.add_dependency "activesupport", "~> 5"

  spec.add_development_dependency "rails", "~> 5.2.2"
  spec.add_development_dependency "sqlite3", "~> 1.3.6"
  spec.add_development_dependency "sorcery", "~> 0.13"
end
