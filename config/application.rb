require_relative 'boot'

require 'rails/all'
require 'rack/cors'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsAutomotivePortal
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.api_only = true

    config.middleware.insert_before 0, Rack::Cors do
          allow do
            origins '*'
            resource '*', :headers => :any, :methods => [:get, :post, :put, :patch, :delete, :options, :head]
          end
        end

  end
end
