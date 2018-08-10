role :app, %w[worker@142.93.53.196]
role :web, %w[worker@142.93.53.196]
role :db,  %w[worker@142.93.53.196]

set :branch, 'master'
set :rails_env, 'production'
set :puma_env, :production

server '142.93.53.196', user: 'worker', roles: %w[web app]
