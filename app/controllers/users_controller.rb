require 'net/http'

class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.address_n = params[:address_n]
    @user.address_zip = params[:address_zip]
    @user.address_street = params[:address_street]
    @user.address_city = params[:address_city]
    @user.address = "#{params[:address_n]}" + " " + "#{params[:address_street]}" + " " + "#{params[:address_zip]}" + " " + "#{params[:address_city]}"
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
    @map = []
    @geo_user = User.geocoded.find(@user.id)
    @map << @geo_user
    @marker = @map.map do |marker|
      {
        lat: marker.latitude,
        lng: marker.longitude
      }
    end
  end

  def user_adress
    uri = URI("https://api-adresse.data.gouv.fr/search/?q=#{params[:query]}")
    Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
      request = Net::HTTP::Get.new uri
      @response = http.request request # Net::HTTPResponse object
    end
    @pjson = JSON.parse(@response.body)
    render json: @pjson
  end

  private

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :admin,
                                 :already_logged, :address_n, :address_zip,
                                 :address_street)
  end
end
