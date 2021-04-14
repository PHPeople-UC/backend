require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)

module Phpeople
  class Application < Rails::Application
    config.i18n.fallbacks = [:es, :en]
    config.i18n.default_locale = 'es-CL'
    config.active_job.queue_adapter = :sidekiq
    config.assets.paths << Rails.root.join('node_modules')
    config.load_defaults 6.0
  end
end
