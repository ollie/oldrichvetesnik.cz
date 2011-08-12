require 'rake/clean'
require_relative 'deploy.rb' if File.exist? 'deploy.rb'

CLOBBER.include Dir['_site']

task :default => :g

desc 'Run compass compile.'
task :compass do
	sh 'compass compile'
end

desc 'Clobber and jekyll.'
task :g => [ :clobber, :compass ] do
	sh 'jekyll'
end

desc 'Clobber and server.'
task :s => [ :clobber, :g ] do
	sh 'jekyll --server --auto'
end
