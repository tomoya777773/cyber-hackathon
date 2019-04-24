ActiveRecord::Base.establish_connection(ENV['DATABASE_URL']||"sqlite3:db/development.db")
class Album < ActiveRecord::Base

end