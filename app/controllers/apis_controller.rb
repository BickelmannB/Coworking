# require 'net/http'

# class ApisController < ApplicationController
#   def index
# uri = URI("https://api-adresse.data.gouv.fr/search/?q=8+bd+du+port&limit=1")

# Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
#   request = Net::HTTP::Get.new uri

#   @response = http.request request # Net::HTTPResponse object
# end
#   end
# end
