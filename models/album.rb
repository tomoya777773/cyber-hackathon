ActiveRecord::Base.establish_connection(ENV['DATABASE_URL']||"sqlite3:db/development.db")
class Album < ActiveRecord::Base
    belongs_to :category
end

class Category < ActiveRecord::Base
    has_many :albums
end
