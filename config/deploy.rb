# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'todo'
set :repo_url, 'git@github.com:marciotoshio/todo.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/todo'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 2

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  desc 'Setting Twitter key'
  task :set_twitter_key, :command do |task, args|
  	on roles(:web) do
		sed_command = "sed -i --follow-symlinks 's/{TWITTER_KEY}/#{args[:command]}/g' /var/www/todo/current/todo.rb"
		run sed_command
	end
  end

  desc 'Setting Twitter secret'
  task :set_twitter_secret, :command do |task, args|
	on roles(:web) do
		sed_command = "sed -i --follow-symlinks 's/{TWITTER_SECRET}/#{args[:command]}/g' /var/www/todo/current/todo.rb"
		run sed_command
	end
  end

end
