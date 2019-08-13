class ReservationsController < ApplicationController
  before_action :check_user
  def index
    @reservations = Reservation.all
  end

  def new
    @workplace = Workplace.find(params[:workplace_id])
    @reservation = Reservation.new
  end

  def create
    @user = current_user
    @workplace = Workplace.find(params[:WorkplaceId])
    if @workplace.available_places.zero?
      redirect_to workplaces_path, alert: 'Sorry, workplace is full for this date'
    else
      @reservation = Reservation.new(reservations_params)
      @reservation.workplace = @workplace
      @reservation.user = @user
      if @reservation.save
        redirect_to reservation_path(@reservation)
      else
        render :new
      end
    end
  end

  def edit
    @reservation = find
  end

  def update
    @reservation = find
    @reservation.update(reservations_params)
    redirect_to reservation_path(@reservation)
  end

  def show
    @reservation = find
  end

  def destroy
    @reservation = find
    @reservation.destroy
    redirect_to reservations_path
  end

  private

  def check_user
    if user_signed_in?
      return true
    else
      redirect_to root_path, alert: "Sorry, only users can book a workplace"
      return false
    end
  end

  def find
    Reservation.find(params[:id])
  end

  def reservations_params
    params.require(:reservation).permit(:workplace_id, :user_id, :starting_date, :ending_date)
  end
end
