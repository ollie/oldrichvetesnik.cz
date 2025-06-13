source 'https://rubygems.org'

# Sinatra is a DSL for quickly creating web applications in Ruby with minimal
# effort.
gem 'sinatra', '>= 1.4', require: 'sinatra/base'

# Slim is a template language whose goal is reduce the syntax to the essential
# parts without becoming cryptic.
gem 'slim'

# Like a modern code version of the mythical beast with 100 serpent heads,
# Typhoeus runs HTTP requests in parallel while cleanly encapsulating handling
# logic.
gem 'typhoeus'

# A common interface to multiple JSON libraries, including Oj, Yajl, the JSON
# gem (with C-extensions), the pure-Ruby JSON gem, NSJSONSerialization, gson.rb,
# JrJackson, and OkJson.
gem 'multi_json'

# The fastest JSON parser and object serializer.
gem 'oj'

gem 'logger'

group :development do
  gem 'puma', require: false

  # rbenv integration for Capistrano.
  gem 'capistrano-rbenv', require: false

  # Bundler support for Capistrano 3.x.
  gem 'capistrano-bundler', require: false

  # Passenger support for Capistrano 3.x.
  gem 'capistrano-passenger', require: false

  # Compass is a Sass-based Stylesheet Framework that streamlines the creation
  # and maintenance of CSS.
  gem 'compass'

  gem 'ed25519', require: false      # Required for Capistrano to work with ed25519 key.
  gem 'bcrypt_pbkdf', require: false # Required for Capistrano to work with ed25519 key.
end

group :development, :test do
  # An IRB alternative and runtime developer console.
  gem 'pry'
  gem 'reline', require: false
end

group :test do
  # BDD for Ruby.
  gem 'rspec'

  # Rack::Test is a small, simple testing API for Rack apps. It can be used on
  # its own or as a reusable starting point for Web frameworks and testing
  # libraries to build on. Most of its initial functionality is an extraction of
  # Merb 1.0's request helpers feature.
  gem 'rack-test'

  # Code coverage for Ruby 1.9+ with a powerful configuration library and
  # automatic merging of coverage across test suites
  gem 'simplecov'

  # WebMock allows stubbing HTTP requests and setting expectations on HTTP
  # requests.
  gem 'webmock'
end
