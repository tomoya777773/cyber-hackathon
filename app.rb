require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require "net/http"
require "uri"
require "openssl"
require "json"
require "will_paginate/view_helpers/sinatra"
require "will_paginate/active_record"
require "./models/album.rb"

helpers WillPaginate::Sinatra, WillPaginate::Sinatra::Helpers

get '/' do
  @albums = Album.all.paginate(:page => params[:page], :per_page => 5)
  erb :index

end

get '/upload' do
  erb :upload

end

post '/upload' do
  title = params[:title]
  text = params[:text]
  image = params[:image]
  output_path = "public/assets/images/" + "#{image["filename"]}"
  File.open(output_path, 'w+b') do |fp|
    fp.write image["tempfile"].read
  end
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
