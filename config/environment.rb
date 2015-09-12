require 'rubygems'
require 'sinatra'
require 'mongo'
require 'mongo_mapper'
require 'json/ext' # required for .to_json

configure :development, :test, :production do

  ENV["RACK_ENV"] ||= "development"

  MongoMapper.database = "locations_" + ENV["RACK_ENV"]
  MongoMapper.setup({ENV["RACK_ENV"] => {'uri' => "mongodb://127.0.0.1:27017/locations_#{ENV['RACK_ENV']}"}}, ENV["RACK_ENV"])
end