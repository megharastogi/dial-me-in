# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
AutoConfCall::Application.initialize!

# Rails Logger
Rails.logger = Logger.new(STDOUT)