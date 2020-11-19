# PaxfulEngine

A mountable Rails engine that saves completed trades from [paxful](https://paxful.com/)
marketplace and lets you do anything with it.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'paxful_engine-rails'
```

And then execute:

```bash
$ bundle
$ rails paxful_engine:install:migrations
$ rails db:migrate
```

Or install it yourself as:
```bash
$ gem install paxful_engine-rails
```

### Configuration

Create an initializer in your Rails application:

```
# config/initializers/paxful_engine-rails.rb

PaxfulEngine.configure do |c|
  c.paxful_key = "your paxful key"
  c.paxful_secret = "your paxful secret"
  c.on_sync_callback = "SyncCallback"
  c.on_failure_callback = "FailureCallback"
end
```

#### c.on_sync_callback

An object that responds to `call` that gets executed after a trade is (re)processed.
It accepts a `Trade` as its only argument.

```
# example
class SyncCallback

  def self.call(trade)
    # do anything you want with this record
  end

end
```

#### c.on_failure_callback

An object that responds to `call` that gets executed when a trade cannot be created.

It accepts two arguments:
- exception
- payload

```
# example
class FailureCallback

  def self.call(e, payload)
    # log somewhere...
  end

end
```

### Usage

Add this to your scheduler somewhere:
```
# sidekiq_cron.yml
refresh_paxful_order_book:
  cron: "*/2 * * * * Asia/Singapore" # runs every 2 minutes
  class: "PaxfulEngine::SyncOrderBookJob"
```

From the host app:
- Check list of trades at `/paxful_engine/trades`.
- Details per trade at `/paxful_engine/trades/:id`.

### Development

```
$ rails db:create db:migrate db:test:prepare
```

If you need to re-record cassettes, `cp .env{,.local}` and edit the values.

### Testing

```
$ bundle exec rspec spec
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

