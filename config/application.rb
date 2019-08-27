require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Casiopea
  class Application < Rails::Application
    # for carrierwave ImageUploader's error
    config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')]

    config.load_defaults 5.2

    config.i18n.default_locale = :ja

    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end

    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    Rails.application.config.assets.paths << Rails.root.join('vendor', 'bootstrap')
    Rails.application.config.assets.paths << Rails.root.join('vendor', 'jquery')
    Rails.application.config.assets.precompile += %w(*.eot *.woff *.woff2 *.ttf *.svg *.otf *.png *.jpg *.gif )

  end
end
