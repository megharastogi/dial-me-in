class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :twilio_init

  private

  def twilio_init
  	private_config = YAML.load_file('config/private_config.yml')
  	@client = Twilio::REST::Client.new private_config['twilio']['account_sid'], private_config['twilio']['auth_token']
  end
end
