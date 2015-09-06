require_relative "../spec_helper"
require_relative "../../app/controllers/application_controller"
require_relative "../../app/controllers/cars_controller"

ENV['RACK_ENV'] = 'test'

RSpec.describe CarsController do
  def app
    CarsController
  end

  describe "GET todos" do      
	  context "no todos" do      
	    it "returns no todo" do
	      get "/"

	      #expect(last_response.body).to eq("")
	      expect(last_response.status).to eq 200
	    end
	  end
	end
end