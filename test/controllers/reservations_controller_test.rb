require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
fixtures :users, :workplaces
  # Setup

  def setup
    sign_in users(:brice)
    @user = users(:brice)
    current_user = @user
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
    get new_reservation_url(workplace_id: @workplace)
    assert_response :success
  end

  test "should get create" do
    @resa = Reservation.new(starting_date: Date.today, ending_date: Date.today)
    @resa.workplace = @workplace
    @resa.user = @user
    @resa.save
    post reservations_url
    assert_response :success
  end

  test "should get edit" do
    @resa = Reservation.new(starting_date: Date.today, ending_date: Date.today)
    @resa.workplace = @workplace
    @resa.user = @user
    @resa.save
    get edit_reservation_url(@resa)
    assert_response :success
  end

  test "should get update" do
    @resa = Reservation.new(starting_date: Date.today, ending_date: Date.today)
    @resa.workplace = @workplace
    @resa.user = @user
    @resa.save
    put reservation_url(@resa)
    assert_response :success
  end

  test "should get show" do
    byebug
    @resa = Reservation.create!(starting_date: Date.today, ending_date: Date.today, user: @user, workplace: @worplace)
    get reservation_url(@resa)
    assert_response :success
  end

  test "should get destroy" do
    @resa = Reservation.new(starting_date: Date.today, ending_date: Date.today)
    @resa.workplace = @workplace
    @resa.user = @user
    @resa.save
    @resa.destroy
    assert_not @resa

  end

  # Validations tests


  # Methods tests
end
