require "bundler"
require 'pry'
Bundler.require

class CarsController < ApplicationController
	get '/' do
		if params[:location]
			@car_locations = CarLocation.near(params[:location].split(",").map(&:to_f),  500, (params[:page].to_i || 0))
		else
			@car_locations = CarLocation.get_all(params[:page].to_i || 0)
		end
		jbuilder :index
  end
end