ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "vcr"
require "pry"
require "rspec/rails"
require "factory_bot"

require "dotenv"
Dotenv.load(".env.local", ".env")

Dir[PaxfulEngine::Engine.root.join("spec/support/**/*.rb")].each do |f|
  require f
end

RSpec.configure do |config|
  config.use_transactional_fixtures = true
end
