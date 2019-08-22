require 'test_helper'

class RequestsControllerTest < ActionDispatch::IntegrationTest

  # Validations tests

  test "should not save request without name" do
    request = Request.new
    request.email = "jojo@toto"
    request.phone_number = "060606060606"
    request.biography = "nan"
    assert_not request.save
  end

  test "should not save request without email" do
    request = Request.new
    request.name = "toto"
    request.phone_number = "060606060606"
    request.biography = "nan"
    assert_not request.save
  end

  test "should not save request without phone_number" do
    request = Request.new
    request.email = "jojo@toto"
    request.name = "toto"
    request.biography = "nan"
    assert_not request.save
  end

  test "should not save request without biography" do
    request = Request.new
    request.email = "jojo@toto"
    request.phone_number = "060606060606"
    request.name = "toto"
    assert_not request.save
  end

  # Methods tests

  test "should get index" do
    get requests_url
    assert_response :success
    assert Request.where(statut: "confirmed")
    assert_response :success
  end

  test "should get new" do
    get new_request_url
    assert_response :success
    assert Request.new
    assert_response :success
  end

  test "should get show" do
    request = Request.new(name: "tot", email: "tot@tot", phone_number: "555", biography: "dodo")
    request.save
    get request_url(request)
    assert_response :success
  end

  test "should set confirmation token" do
    request = Request.new(name: "tot", email: "tot@tot", phone_number: "555", biography: "dodo")
    request.set_confirmation_token
    request.save
    assert_not_nil(request.confirm_token)
  end

  test "should set accept! method" do
    request = Request.new(name: "tot", email: "tot@tot", phone_number: "555", biography: "dodo")
    request.set_confirmation_token
    request.save
    Request.accept!
    assert request.statut = "accepted"
  end

end
