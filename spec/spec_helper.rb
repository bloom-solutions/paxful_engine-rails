ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rspec/rails"

# Dir[BloomCalvin::Engine.root.join("spec/factories/**/*.rb")].each do |f|
#   require f
# end
#
# Dir[BloomCalvin::Engine.root.join("spec/support/**/*.rb")].each do |f|
#   require f
# end

RSpec.configure do |config|
  config.use_transactional_fixtures = true
end
