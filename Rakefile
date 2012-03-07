desc 'Pull latest changes, run bundler and restart server.'
task :update do
  sh 'git pull && bundle install && touch tmp/restart.txt'
end