# Load the Rails application.
require 'opentelemetry/sdk'
require_relative 'application'

if Rails.env.production?
  OpenTelemetry::SDK.configure do |c|
    c.use_all
  end
end

# Initialize the Rails application.
Rails.application.initialize!
