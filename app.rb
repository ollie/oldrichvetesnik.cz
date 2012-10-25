require 'bundler'
Bundler.require

require 'json'
require './lib/partials'
require './lib/core_ext'

set :protection, except: :frame_options # Turn off the X-Frame-Options header to be able to display iframe contents
set :haml, format: :html5, layout: :'layouts/application'

helpers do
  include Sinatra::Partials
end

def current_env
  ENV['RACK_ENV']
end

get '/' do
  @year = Time.now.year
  haml :index
end

get '/cv' do
  haml :cv, layout: :'layouts/cv'
end

get '/github-repositories' do
  data = JSON.parse HTTParty.get('https://api.github.com/users/ollie/repos').body

  @repos = data.map do |item|
    tmp = {}
    tmp[:name]      = item['name']
    tmp[:html_url]  = item['html_url']
    tmp[:pushed_at] = DateTime.parse item['pushed_at']
    tmp
  end.sort! { |repo_a, repo_b| repo_b[:pushed_at] <=> repo_a[:pushed_at] }.slice_in(3)

  haml :github_repositories, layout: false
end
