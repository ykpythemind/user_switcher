# UserSwitcher
Short description and motivation.

## Usage

config/initializers/user_switcher.rb

```
UserSwitcher.configure do |config|
  config.users = [
    { id: 'ykpythemind@example.com', password: 'password' },
    { id: 'mckaoru@example.com', password: 'password' }
  ]
end
```

config/routes.rb

```
  mount UserSwitcher::Engine => "/user_switcher"
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'user_switcher'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install user_switcher
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
