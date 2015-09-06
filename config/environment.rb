require 'rubygems'
require 'sinatra'
require 'mongo'
require 'mongo_mapper'
require 'json/ext' # required for .to_json

configure :development, :production do

  ENV["RACK_ENV"] ||= "development"

  MongoMapper.database = "locations_" + ENV["RACK_ENV"]
  MongoMapper.setup({'development' => {'uri' => "mongodb://127.0.0.1:27017/locations_#{ENV['RACK_ENV']}"}}, 'development')
end

configure :test do

  ENV["RACK_ENV"] ||= "test"
  
  MongoMapper.database = "locations_" + ENV["RACK_ENV"]
  MongoMapper.setup({'test' => {'uri' => "mongodb://127.0.0.1:27017/locations_#{ENV['RACK_ENV']}"}}, 'test')
end