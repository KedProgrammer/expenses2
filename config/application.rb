require File.expand_path('../boot', __FILE__)
   config.assets.initialize_on_precompile = false
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Expenses
  class Application < Rails::Application

  end
end
