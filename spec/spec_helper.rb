require 'factory_girl'
require 'rack/test'
require 'rspec'
 
# set test environment

RSpec.configure do |config|

  ENV['RACK_ENV'] = 'test'
  
  require_relative "../config/environment"
  
  set :run, false
  set :raise_errors, true
  set :logging, false

  config.include FactoryGirl::Syntax::Methods

  config.include Rack::Test::Methods

  #config.include Factory::Syntax::Methods

  config.before(:each) do
    FactoryGirl.factories.clear
    FactoryGirl.find_definitions
    $db = []
  end 

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end 

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end 

  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.disable_monkey_patching!

  config.warnings = true

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end 

  config.profile_examples = 10

  config.order = :random

  Kernel.srand config.seed
end