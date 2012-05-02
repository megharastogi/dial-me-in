# If development, use local yml to init clients
if Rails.env.development?
	private_config = YAML.load_file('config/private_config.yml')
	TWILIO_CLIENT = Twilio::REST::Client.new private_config['twilio']['account_sid'], private_config['twilio']['auth_token']
	IRON_CLIENT = IronWorkerNG::Client.new token: private_config['iron']['token'], project_id: private_config['iron']['project_id']

# Standard production clients init using console-defined params
elsif Rails.env.production?
	TWILIO_CLIENT = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
	IRON_CLIENT = IronWorkerNG::Client.new token: ENV['IRON_TOKEN'], project_id: ENV['IRON_PROJECT_ID']
end

# Upload/update IronWorker
IRON_CLIENT.codes.create(IronWorkerNG::Code::Ruby.new 'app/workers/call_trigger.rb')