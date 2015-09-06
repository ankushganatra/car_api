require "bundler"
require 'pry'
Bundler.require

class CarsController < ApplicationController
	get '/' do
		binding.pry
		if params[:location]
			@car_locations = CarLocation.near(params[:location].split(",").map(&:to_f),  500)
		else
			@car_locations = CarLocation.all
		end
		jbuilder :index	
  end
end