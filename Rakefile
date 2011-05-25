require 'rake/clean'
require_relative 'deploy.rb' if File.exist? 'deploy.rb'

CLOBBER.include Dir['_site']

task :default => :clokyll

desc 'Clobber and jekyll.'
task :clokyll => :clobber do
	sh 'jekyll'
end

desc 'Clobber and server.'
task :s => :clobber do
	sh 'jekyll --server'
end