require 'net/http'

class ApisController < ApplicationController
  def index
    query = params[:query]
    url = URI.parse("http://api-adresse.data.gouv.fr/search/?q=#{query}&limit=1")
    req = Net::HTTP::Get.new(url.to_s)
    @res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    @adresse = @res.body
    raise
  end
end
