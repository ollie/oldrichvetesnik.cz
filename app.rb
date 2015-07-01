require_relative 'lib/repo'

# Main web application.
class App < Sinatra::Base
  set :slim, layout: :'layouts/application',
             pretty: true

  helpers do
    # Render a Slim partial.
    #
    # @param template [Symbol]
    # @param locals   [Hash]
    #
    # @return [String]
    def partial_slim(template, locals = {})
      slim(template.to_sym, layout: false, locals: locals)
    end
  end

  get '/' do
    year = Date.today.year
    slim :index, locals: { year: year }
  end

  get '/cv' do
    year = Date.today.year
    slim :cv, layout: :'layouts/cv', locals: { year: year }
  end

  get '/github-repositories' do
    repos = Repo.all
    slim :repos, layout: false, locals: { repos: repos }
  end
end
