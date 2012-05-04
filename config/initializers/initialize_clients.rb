# Load clients from ENV Vars
TWILIO_CLIENT = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
IRON_CLIENT = IronWorkerNG::Client.new token: ENV['IRON_TOKEN'], project_id: ENV['IRON_PROJECT_ID']

# Upload/update IronWorker
IRON_CLIENT.codes.create(IronWorkerNG::Code::Ruby.new 'app/workers/call_trigger.rb')