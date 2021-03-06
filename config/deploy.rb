# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'vrmoment_test'
set :repo_url, 'git@github.com:JohnWuTripMoment/vrmoment_test.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
set :scm, :git

set :tmp_dir, "/home/apps/tmp"

set :passenger_restart_with_touch, true

# set :rvm_type, :ubuntu
# set :rvm_custom_path, '~/home/ubuntu/.rvm'  # only needed if not detected

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/application.yml')
set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

## set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5


namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # invoke 'unicorn:legacy_restart'
      "touch %RAILS_ROOT%/tmp/restart.txt"
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  # after 'deploy:publishing', 'deploy:restart'

  # after :restart, :clear_cache do
  #   on roles(:web), in: :groups, limit: 3, wait: 10 do
  #     # Here we can do anything such as:
  #     # within release_path do
  #     #   execute :rake, 'cache:clear'
  #     # end
  #   end
  # end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'

end
