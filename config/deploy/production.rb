role :app, %w[worker@206.189.196.251]
role :web, %w[worker@206.189.196.251]
role :db,  %w[worker@206.189.196.251]

set :branch, 'master'
set :rails_env, 'production'
set :puma_env, :production

server '206.189.196.251', user: 'worker', roles: %w[web app]
