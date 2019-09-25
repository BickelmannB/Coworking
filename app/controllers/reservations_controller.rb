class ReservationsController < ApplicationController
  before_action :check_user
  def index
    @reservations = Reservation.where("user_id = :id", id: current_user)
  end

  def new
    @workplace = Workplace.find(params[:workplace_id])
    @reservation = Reservation.new
  end

  def create
    @user = current_user
    @workplace = Workplace.find(params[:WorkplaceId])
    @resa = Reservation.new(reservations_params)
    unless @workplace.bookable?(@resa.starting_date, @resa.ending_date)
      redirect_to workplaces_path, alert: 'Sorry, workplace is full for this date'
    else
      @resa.workplace = @workplace
      @resa.user = @user
      if @resa.save
        redirect_to reservation_path(@resa)
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

  def pdf
    @reservations = Reservation.where("user_id = :id", id: current_user)
    html = render_to_string(action: "index", layout: false)
    kit = PDFKit.new(html, page_size: 'Letter',
                           footer_center: "Page [page] of [toPage]",
                           header_html: "/app/views/reservations/header.html", layout: false)
    # kit.stylesheets << '/app/assets/stylesheets/pages/index.scss'
    send_data(kit.to_pdf, filename: 'report.pdf', type: 'application/pdf', dispotition: 'inline')
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
