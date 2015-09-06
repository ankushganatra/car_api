#rackup file

require 'sinatra/base'

require 'sinatra'
require './config/environment'


# pull in the models and controllers
Dir.glob('./app/{models,controllers}/*.rb').each { |file| require file }



# map the controllers to routes
#map('/cars') { run CarsController }

run Rack::URLMap.new("/cars" => CarsController)

#map('/') { run ApplicationController }

map ("/public") {  run Rack::Directory.new("./public") }