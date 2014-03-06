require "rvm/capistrano"
require 'bundler/capistrano'
require './config/boot'
require 'airbrake/capistrano'

set :port, 22
set :deploy_to, "/home/rails/"
set :use_sudo, false

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup", "deploy:rechown", "deploy:restart" # keep only the last 5 releases


#local deploy to DigitalOcean
set :scm, :git 
set :repository, "git@github.com:j4n-co/supersalon.git" 
#set :deploy_via, :copy 
set :user, "root"
set :password, "supersalon"

set :server_ip, "supersalon.org"
server server_ip, :app, :web, :primary => true
set :rails_env, 'production'

set :keep_releases, 3

set :rvm_type, :user
set :rvm_type, :system

set :bundle_flags, "--deployment --verbose"

#set :bundle_without, [:development, :test, :acceptance]

role :db, server_ip, :primary => true 


before "deploy:start" do
  deploy.migrate
end

namespace :deploy do

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "service unicorn restart"
  end

  task :rechown, :roles => :app, :except => { :no_release => true } do
    run "chown -R rails:www-data /home/rails"
  end
  
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

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

