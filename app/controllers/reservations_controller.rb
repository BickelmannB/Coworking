class ReservationsController < ApplicationController
  require 'net/http'
  require 'uri'
  before_action :check_user, except: :test
  def index
    @reservations = Reservation.where("user_id = :id", id: current_user)
  end

  def new
    @workplace = Workplace.geocoded.find(params[:workplace_id])
    @reservation = Reservation.new
    @user = User.find(current_user.id)
    @map = []
    @geo_user = User.geocoded.find(@user.id)
    # @map << @geo_user
    # @map << @workplace
        uri = URI("https://www.mapquestapi.com/directions/v2/route?key=JcgZc27PbFhSCd31fgF49MorQCA1WfK7&from=marseille&to=paris&outFormat=json&ambiguities=ignore&routeType=fastest&doReverseGeocode=false&enhancedNarrative=false&avoidTimedConditions=false")
    Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
      request = Net::HTTP::Get.new uri
      @response = http.request request # Net::HTTPResponse object
    end
    @json = JSON.parse(@response.body)
    @map << @json
    # @marker = @map.map do |marker|
    #   {
    #     lat: marker.latitude,
    #     lng: marker.longitude
    #   }
    # end
    raise
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
                           header_html: "public/header.html")
    kit.stylesheets << "#{Rails.root}/public/pdfstyle.css"
    send_data(kit.to_pdf, filename: 'report.pdf', type: 'application/pdf', disposition: 'inline')
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
