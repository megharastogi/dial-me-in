require 'net/http'

domain = "dial-me-in.herokuapp.com"
path = "/calls/#{params[:id]}/initiate_conference"

Net::HTTP.get(domain, path)