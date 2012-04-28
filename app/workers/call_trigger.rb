require 'net/http'

url = "http://45yj.localtunnel.com/calls/#{params[:id]}/initiate_conference"

Net::HTTP.get(url)