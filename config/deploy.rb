require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
# require 'mina/rbenv'  # for rbenv support. (http://rbenv.org)
require 'mina/rvm'    # for rvm support. (http://rvm.io)

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :domain, '128.199.57.94'
set :deploy_to, '/root/rails'
set :repository, 'https://github.com/j4n-co/supersalon.git'
set :branch, 'master'

set :keep_releases, 10

# For system-wide RVM install.
#   set :rvm_path, '/usr/local/rvm/bin/rvm'

# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
set :shared_paths, ['config/database.yml', 'log']

# Optional settings:
   set :user, 'root'    # Username in the server to SSH to.
   set :identity_file, '/home/jan/.ssh/supersalon_ubuntu-14.04'
#   set :port, '30000'     # SSH port number.
#   set :forward_agent, true     # SSH forward_agent.

# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .ruby-version or .rbenv-version to your repository.
  # invoke :'rbenv:load'

  # For those using RVM, use this to load an RVM version@gemset.
  # invoke :'rvm:use[ruby-1.9.3-p125@default]'
end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/log"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/config"]

  queue! %[touch "#{deploy_to}/#{shared_path}/config/database.yml"]
  queue  %[echo "-----> Be sure to edit '#{deploy_to}/#{shared_path}/config/database.yml'."]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    queue "export PATH=$PATH:/usr/local/rvm/gems/ruby-2.1.5/bin/bundle:/usr/local/rvm/gems/ruby-2.1.5/bin/bundler:/usr/local/rvm/gems/ruby-2.1.5/bin:/usr/local/rvm/gems/ruby-2.1.5@global/bin:/usr/local/rvm/rubies/ruby-2.1.5/bin:/usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
    invoke 'stop_sunspot'
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'



    to :launch do
      queue "mkdir -p #{deploy_to}/#{current_path}/tmp/"
      queue "mkdir -p #{deploy_to}/#{current_path}/tmp/cache"
      queue "chmod 777 #{deploy_to}/#{current_path}/tmp/cache"
      queue "touch #{deploy_to}/#{current_path}/tmp/restart.txt"
      invoke 'start_sunspot'
      invoke 'force_precompile'
      invoke 'restart'
    end
  end
end

task :stop_sunspot do
  queue 'service nginx stop'
  if File.exists?('/home/rails/supersalon/current/solr/pids/production/sunspot-solr-production.pid')
    queue "cd /home/rails/supersalon/current ; RAILS_ENV=production bundle exec rake sunspot:solr:stop"
  end
end

task :start_sunspot do

  queue "cd /home/rails/supersalon/current ; RAILS_ENV=production bundle exec rake sunspot:solr:start"
  queue "cd /home/rails/supersalon/current ; RAILS_ENV=production bundle exec rake sunspot:solr:reindex"
end


task :force_precompile do
  queue "cd /home/rails/supersalon/current ; RAILS_ENV=production bundle exec rake assets:precompile"
end

task :restart do
      queue 'service nginx start'
end

# For help in making your deploy script, see the Mina documentation:
#
#  - http://nadarei.co/mina
#  - http://nadarei.co/mina/tasks
#  - http://nadarei.co/mina/settings
#  - http://nadarei.co/mina/helpers

