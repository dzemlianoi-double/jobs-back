require 'capistrano'
require 'capistrano/scm/git'
require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/monit'
require 'capistrano/sidekiq'
require 'capistrano/sidekiq/monit' # to require monit tasks # Only for capistrano3
require 'capistrano/puma'

install_plugin Capistrano::SCM::Git
install_plugin Capistrano::Puma

Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
