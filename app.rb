require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require "net/http"
require "uri"
require "openssl"
require "json"
require "./models/album.rb"

get '/' do
  @albums = Album.all
  erb :index

end

post '/upload' do
end

API_URL = 'http://c0eae18c.ngrok.io/get_class'
uri = URI.parse(API_URL)
http = Net::HTTP.new(uri.host, uri.port)
req = Net::HTTP::Post.new(uri.request_uri)
req["Content-Type"] = "application/json"
req.set_form_data({"url": "https://f67ad5f1.ngrok.io/assets/images/test.jpeg"})
res = http.request(req)
puts res.body

def save_image(url)
  fileName = File.basename(url)
  dirName = "/public/assets/images/"
  filePath = dirName + fileName

  FileUtils.mkdir_p(dirName) unless FileTest.exist?(dirName)

  open(filePath, 'wb') do |output|
    open(url) do |data|
      output.write(data.read)
    end
  end
end