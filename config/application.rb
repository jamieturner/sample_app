require File.expand_path('../boot', __FILE__)

#Include CSV library
require 'csv'

#Import csv
#require 'iconv'

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module SampleApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)

    #config.action_mailer.smtp_settings = {
    # :address   => "smtp.mandrillapp.com",
    #:port      => 587, # ports 587 and 2525 are also supported with STARTTLS
    #:enable_starttls_auto => true, # detects and uses STARTTLS
    #   :user_name => "jamieturner84@hotmail.com",
    #  :password  => "zxyD3qZoFP8YsXvs6SRczQ", # SMTP password is any valid API key
    # :authentication => 'login', # Mandrill supports 'plain' or 'login'
    #:domain => 'localhost:3000', # your domain to identify your server when connecting
    # }

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      :user_name => 'sampleapp1-6985031ce57cd966',
      :password => '5eee810a46487563',
      :address => 'mailtrap.io',
      :port => '2525',
      :authentication => :plain
    }

  end
end