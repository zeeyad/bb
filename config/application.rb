require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module Bb
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.secret_key_base = 'ebaf140470419eceee769002afbead445b0a8ddbb6cc38b0b8dcb13762471e433c35eeb305153b1c4167820d462490644ad5fde85a9197b6794edaf03802957a'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
