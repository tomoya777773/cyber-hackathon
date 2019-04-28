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

get '/category' do
  @categories = Category.all
  erb :category
end

get '/images/:id' do
  @image = Album.find(params[:id])
  @title = @image["title"]
  @text = @image["text"]
  @image_path = "/assets/images/" + "#{@image["url"]}" + ".jpg"
  erb :select
end


get '/ranking' do
  @albums = Album.order('score DESC').paginate(:page => params[:page], :per_page => 10)
  erb :index
end


post '/upload' do
  @title = params[:title]
  @text = params[:text]
  image = params[:image]
  @image_path = "/assets/images/" + "#{image["filename"]}"
  output_path = "public/assets/images/" + "#{image["filename"]}"
  File.open(output_path, 'w+b') do |fp|
    fp.write image["tempfile"].read

  erb :finish_upload
  end

end

def call_api 
  # API_URL = 'http://c0eae18c.ngrok.io/get_class'
  uri = URI.parse(API_URL)
  http = Net::HTTP.new(uri.host, uri.port)
  req = Net::HTTP::Post.new(uri.request_uri)
  req["Content-Type"] = "application/json"
  req.set_form_data({"url": "https://f67ad5f1.ngrok.io/assets/images/test.jpeg"})
  res = http.request(req)
  puts res.body
end
