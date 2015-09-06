require 'sinatra'
require 'rack/rest_api_versioning'

class ApplicationController < Sinatra::Base

	use Rack::RestApiVersioning, :default_version => '1'

  configure :production, :development do
    enable :logging
    # sets root as the parent-directory of the current file
  end

  # sets root as the parent-directory of the current file

	set :root, File.expand_path('.')
	# sets the view directory correctly
	set :views, Proc.new { File.join(root, "app/views") }

  
end