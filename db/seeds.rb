require "./models/album.rb"
@alubms = ["test1", "test2", "test3", "test4", "test5", "test6"]
@alubms.each do |alubm|
Album.create(title: alubm, url: alubm)
end