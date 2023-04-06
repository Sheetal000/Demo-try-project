# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

run Rails.application
Rails.application.load_server
# require 'sidekiq'
# Sidekiq.configure_client do |config|
#     config.redis = {db: 1}
# end

# Sidekiq.configure_server do |config|
#     config.redis = {db: 1}
# end
