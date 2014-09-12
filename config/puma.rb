threads 1, 6
workers 2

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 8080
environment ENV['RACK_ENV'] || 'production'


on_worker_boot do
  require "active_record"
  cwd = File.dirname(__FILE__)+"/.."
  ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
  ActiveRecord::Base.establish_connection(ENV["DATABASE_URL"] || YAML.load_file("#{cwd}/config/database.yml")[ENV["RAILS_ENV"]])
end