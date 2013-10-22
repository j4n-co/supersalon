require "rvm/capistrano"
require 'bundler/capistrano'

set :application, "supersalon"
set :port, 22
set :deploy_to, "/home/rails/"
set :use_sudo, false

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases


#local deploy to DigitalOcean
set :scm, :git 
set :repository, "git@github.com:j4n-co/supersalon.git" 
#set :deploy_via, :copy 
set :user, "rails"

set :server_ip, "37.139.10.22"
server server_ip, :app, :web, :primary => true
set :rails_env, 'production'

set :keep_releases, 3

set :rvm_type, :user
set :rvm_type, :system

set :bundle_without, [:development, :test, :acceptance]

namespace :deploy do
  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      run "cd #{current_path} && #{rake} RAILS_ENV=#{rails_env} RAILS_GROUPS=assets assets:precompile --trace"
    end
  end
end

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end