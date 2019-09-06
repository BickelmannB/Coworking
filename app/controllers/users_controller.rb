require 'net/http'

class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    uri = URI("https://api-adresse.data.gouv.fr/search/?q=#{params[:query]}&limit=1")
    Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
      request = Net::HTTP::Get.new uri
      @response = http.request request # Net::HTTPResponse object
      end
      @pjson = JSON.parse(@response.body)
      @user.address = @pjson["features"].first["properties"]["label"]
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :admin, :already_logged, :address)
  end
end
