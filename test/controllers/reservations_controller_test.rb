require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
fixtures :users, :workplaces
  # Setup

  def setup
    sign_in users(:brice)
    @user = users(:brice)
    @workplace = workplaces(:place)
  end

  # Routes tests

  test "should get index" do
    get reservations_url
    assert_response :success
  end

  test "should get new" do
    @workplace = Workplace.new(name: "toto", total_places: 10, description: "lol")
    @workplace.save
    get new_reservation_url(@workplace.id)
    assert_response :success
  end

  test "should get create" do
    post reservations_url
    assert_response :success
  end

  test "should get edit" do
    get edit_reservation_url
    assert_response :success
  end

  test "should get update" do
    put reservation_url
    assert_response :success
  end

  test "should get show" do
    @resa = Reservation.new(starting_date: Date.today, ending_date: Date.today)
    @resa.workplace = @workplace
    @resa.user = @user
    @resa.save
    get reservation_url(@resa)
    assert_response :success
  end

  test "should get destroy" do

    destroy reservation_path
    assert_response :success
  end

  # Validations tests


  # Methods tests
end
