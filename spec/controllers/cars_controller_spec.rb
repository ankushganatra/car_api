require_relative "../spec_helper"
require_relative "../../app/controllers/application_controller"
require_relative "../../app/controllers/cars_controller"
require_relative "../../app/models/car_location"

RSpec.describe CarsController do

  def app
    @app ||= CarsController.new
  end

  before(:each) do 
  	CarLocation.delete_all
  end

  describe "path /cars" do
	  context "car location " do      
	    it "returns all cars location" do
	      get "/"
	      expect(last_response.status).to eq 200
	      expect(last_response.body).to eq("{\"cars\":[]}")
	    end

	    it "should return nearest car location if latitude logitude passed" do
	    	@car_locations = create(:car_location)
	    	get "/", params = {
	        location: "51.5444204,-0.22707"
	      }
	      expect(last_response.status).to eq 200
	      expect(last_response.body).to eq("{\"cars\":[{\"description\":\"Angel - Myddleton Sq\",\"latitude\":51.529679,\"longitude\":-0.108989}]}")
	    end
	    it "should return empty result for second page" do
	    	@car_locations = create(:car_location)
	    	get "/", params = {
	        location: "51.5444204,-0.22707",
	        page: '1'
	      }
	      expect(last_response.status).to eq 200
	      expect(last_response.body).to eq("{\"cars\":[]}")
	    end
	  end
	end
end