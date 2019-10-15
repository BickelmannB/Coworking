require 'test_helper'
require 'net/http'

class UsersControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers
fixtures :users

  def setup
   sign_in users(:brice)
   @user = users(:brice)
   current_user = @user
  end


  test "should get edit" do
    get edit_user_path(@user)
    assert_response :success
  end

  test "should get update" do
    put user_path(@user), params: { user: {  email: "brice@brice",
                                     encrypted_password: "password",
                                     admin: true,
                                     already_logged: true,
                                     address_n: "3",
                                     address_zip: "13009",
                                     address_street: "chemin de la colline saint joseph",
                                     address_city: "marseille",
                                     address: "3, chemin de la colline saint joseph 13009 marseille",
                                     latitude: 5.653256,
                                     longitude: 42.256895 }}
    assert_response :redirect
    follow_redirect!
    get user_path(@user)
    assert_response :success
  end

  test "should get show" do
    get user_path(@user)
    assert_response :success
  end

  test "should get user_address of external api" do
    uri = URI("https://api-adresse.data.gouv.fr/search/?q=test")
    Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
      request = Net::HTTP::Get.new uri
      @response = http.request request # Net::HTTPResponse object
    end
    @pjson = JSON.parse(@response.body)
    assert_not_nil @pjson
  end
end
