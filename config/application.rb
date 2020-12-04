require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Education
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.active_job.queue_adapter = :delayed_job
    config.serve_static_assets = true  # deprecated
    config.serve_static_files = true   # Ok

    config.middleware.use Rack::Cors do
      allow do
        origins '*' 
        resource '*',
        headers: :any,
        #this is errors for device token
        expose: ['access-token', 'expiry', 'token-type', 'uid', 'client'],
        methods: [:get, :post, :options, :delete, :put, :patch]
      end
    end



    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end



# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.














