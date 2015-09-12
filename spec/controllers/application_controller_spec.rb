require_relative "../spec_helper"
require_relative "../../app/controllers/application_controller"


RSpec.describe ApplicationController do
	def app
    @app ||= ApplicationController.new
  end

  describe "root path" do
  	context "root path " do      
	    it "returns 404 error" do
	      get "/"
	      expect(last_response.status).to eq 404
	    end
	  end
  end
end
