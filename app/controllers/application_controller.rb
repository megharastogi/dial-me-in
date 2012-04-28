class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :client_init

  private

  def client_init
  	private_config = YAML.load_file('config/private_config.yml')
  	@twilio_client = Twilio::REST::Client.new private_config['twilio']['account_sid'], private_config['twilio']['auth_token']
  	@iron_client = IronWorkerNG::Client.new token: private_config['iron']['token'], project_id: private_config['iron']['project_id']
  	# Upload/update IronWorker
  	@iron_client.codes.create(IronWorkerNG::Code::Ruby.new 'app/workers/call_trigger.rb')
  end
end
