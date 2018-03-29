require 'bundler'

Bundler.require

ActiveRecord::Base.establish_connection(
:adapter => "sqlite3",
:database => "db/devlopment.sqlite"
)

require_all 'app'
