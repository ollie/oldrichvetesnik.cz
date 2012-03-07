require 'sinatra'
require 'haml'
require 'httparty'
require 'json'
require 'pry'
require './partials'

set :haml, :format => :html5

helpers do
  include Sinatra::Partials
end

# def basic_haml(template, options = {})
#   haml template, options.merge(:layout => :'basic_layout')
# end

get '/' do
  haml :index
end

get '/github-repositories' do
  data = JSON.parse HTTParty.get('https://api.github.com/users/ollie/repos').body

  @repos = data.map do |item|
    tmp = {}
    tmp[:name]      = item['name']
    tmp[:html_url]  = item['html_url']
    tmp[:pushed_at] = DateTime.parse item['pushed_at']
    tmp
  end.sort! { |repo_a, repo_b| repo_b[:pushed_at] <=> repo_a[:pushed_at] }

  haml :github_repositories, :layout => false
end