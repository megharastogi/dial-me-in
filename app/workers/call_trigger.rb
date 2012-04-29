require 'net/http'

domain = "4bgc.localtunnel.com"
path = "/calls/#{params[:id]}/initiate_conference"

Net::HTTP.get(domain, path)