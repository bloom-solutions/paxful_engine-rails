require "gem_config"
require "paxful_client"
require "sidekiq"

require "paxful_engine/engine"

module PaxfulEngine

  include GemConfig::Base

  with_configuration do
    has :paxful_key, classes: [NilClass, String]
    has :paxful_secret, classes: [NilClass, String]
    has :on_sync_callback
    has :on_failure_callback
  end

end
