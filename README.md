# PaxfulRails

A mountable Rails engine that saves completed trades from [paxful](https://paxful.com/)
marketplace and lets you do anything with it.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'paxful_rails'
```

And then execute:

```bash
$ bundle
$ rails paxful_rails:install:migrations
$ rails db:migrate
```

Or install it yourself as:
```bash
$ gem install paxful_rails
```

### Configuration

Create an initializer in your Rails application:

```
# config/initializers/paxful_rails.rb

PaxfulRails.configure do |c|
  c.paxful_key = "your paxful key"
  c.paxful_secret = "your paxful secret"
  c.on_sync_callback = "YourCallback"
end
```

#### c.on_sync_callback

An object that responds to `call` that gets executed after a trade is (re)processed.
It accepts a `Trade` as its only argument.

```
# example
class YourCallback

  def self.call(trade)
    # do anything you want with this record
  end

end
```

### Development

```
$ rails db:migrate
$ rails db:migrate db:test:prepare
```

### Testing

```
$ bundle exec rspec spec
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

