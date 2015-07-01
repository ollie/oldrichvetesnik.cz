require 'bundler'

ENV['RACK_ENV'] = 'test'
Bundler.require(:default, ENV['RACK_ENV'])

# Coverage tool, needs to be started as soon as possible
SimpleCov.start do
  # Ignore:
  add_filter '/spec/'
end

require './app'
require 'request_stubs'

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.disable_monkey_patching!

  def app
    App
  end

  def last_status
    last_response.status
  end

  def last_body
    last_response.body
  end
end
