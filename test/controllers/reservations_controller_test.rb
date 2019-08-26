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
    get new_reservation_url(workplace_id: @workplace)
    assert_response :success
  end

  test "should get create" do
   post reservations_url, params: { reservation: { starting_date: Date.today, ending_date: Date.today }, WorkplaceId: @workplace.id }
   assert_response :redirect
   follow_redirect!
   get reservation_url(Reservation.last)
   assert_response :success
  end

  test "should get edit" do
    @resa = Reservation.new(workplace: @workplace, user: @user, starting_date: Date.today, ending_date: Date.today)
    @resa.save
    get edit_reservation_url(@resa)
    assert_response :success
  end

  test "should get update" do
    @resa = Reservation.new(starting_date: Date.today, ending_date: Date.today)
    @resa.workplace = @workplace
    @resa.user = @user
    @resa.save
    put reservation_url(@resa), params: { reservation: { workplace: @workplace, user: @user, starting_date: Date.today, ending_date: Date.today } }
    assert_response :redirect
    follow_redirect!
    get reservation_url(@resa)
    assert_response :success
  end

  test "should get show" do
    @resa = Reservation.new(starting_date: Date.today, ending_date: Date.today)
    @resa.user = @user
    @resa.workplace = @workplace
    @resa.save
    get reservation_url(@resa)
    assert_response :success
  end

  test "should get destroy" do
    @resa = Reservation.new(starting_date: Date.today, ending_date: Date.today)
    @resa.workplace = @workplace
    @resa.user = @user
    @resa.save
    assert @resa.destroy
  end

  # Validations tests

  # Methods tests
end
