$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "paxful_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "paxful_engine-rails"
  spec.version     = PaxfulEngine::VERSION
  spec.authors     = ["Mark Chavez"]
  spec.email       = ["mjfchavez@gmail.com"]
  spec.homepage    = "https://github.com/bloom-solutions/paxful_engine-rails"
  spec.summary     = "Mountable engine that fetches completed paxful trades."
  spec.description = "Mountable engine that fetches completed paxful trades."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "gem_config", "~> 0.3.0"
  spec.add_dependency "paxful_client", "~> 0.3.0"
  spec.add_dependency "rails", "~> 5.2"
  spec.add_dependency "sidekiq"

  spec.add_development_dependency "dotenv", "~> 2.5"
  spec.add_development_dependency "factory_bot_rails"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
