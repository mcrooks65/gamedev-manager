ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

# ActiveRecord::Base.establish_connection(
#   :adapter => "sqlite3",
#   :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
# )

set :database, {adapter: "sqlite3", database: "db/development.db"} 

require_all 'app'
