require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require "net/http"
require "uri"
require "openssl"
require "json"

get '/' do
  'Hello World'
end
