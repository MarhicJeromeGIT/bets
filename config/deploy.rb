# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'bets'
set :repo_url, 'git@github.com:MarhicJeromeGIT/bets.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/bets'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

#set :rvm1_ruby_version, '2.3.0'
#set :rvm1_alias_name, '2.3.0@bets'
set :rvm_ruby_version, '2.3.0@bets'


# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
#set :unicorn_binary, "/usr/bin/unicorn"
#set :unicorn_config, "#{current_path}/config/unicorn.rb"
#set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
  
  # Restart Unicorn
  task  :restart_unicorn do
    on roles(:app) do
      execute "sudo service unicorn_bets stop"
      execute "sudo service unicorn_bets start"
    end
  end
  
 # before 'deploy', 'rvm1:install:rvm'  # install/update RVM
 # before 'deploy', 'rvm1:install:ruby'  # install/update Ruby
 # before 'deploy', 'rvm1:alias:create'
 # before 'deploy', 'rvm1:install:gems'  # install/update gems from Gemfile into gemset

  after 'deploy', 'restart_unicorn'
end
