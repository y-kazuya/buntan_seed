lock "~> 3.11.0"

set :application, 'buntan_seed'
set :repo_url,  'git@github.com:y-kazuya/buntan_seed.git'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'
set :pty, true

set :ssh_options, auth_methods: ['publickey'],
                  keys: ["/Users/kazuya/.ssh/buntan_key.pem"]

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5
set :yarn_flags, "--prefer-offline --production --no-progress"
set :yarn_roles, :app

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end

  task :db_seed do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end

  task :db_reset do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:migrate:reset', "DISABLE_DATABASE_ENVIRONMENT_CHECK=1"
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end
end