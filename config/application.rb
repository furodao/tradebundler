require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Salesapp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.precompile += %w(*.svg *.eot *.woff *.ttf *.gif *.png *.ico)

    config.action_dispatch.default_headers = {
        'X-Frame-Options' => 'ALLOWALL'
    }

		config.i18n.default_locale = 'sv'
  end
end
