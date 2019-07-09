class RequestsController < ApplicationController
  def index
    @requests = Request.where(statut: 'confirmed').order(created_at: :asc)
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      @request.set_confirmation_token
      @request.save(validate: false)
      UserMailer.registration_confirmation(@request).deliver_now
      flash[:success] = "Please confirm your email address to continue"
      redirect_to requests_path
    else
      flash[:error] = "Invalid, please try again"
      render :new
    end
  end

  def contract_acceptation
    @request = Request.find_by_confirm_token(params[:token])
    if @request
      @request.contract_accepted = true
      @request.save!
      flash[:success] = "Welcome to Coworking! your contract has been signed. it will be automatically renewed every month"
      UserMailer.one_month_contract(@request).deliver_later(wait_until: 1.month.from_now)
    end
    redirect_to request_path(@request)
  end

  def confirm_email
    @request = Request.find_by_confirm_token(params[:token])
    if @request
      @request.email_confirmed = true
      @request.statut = 'confirmed'
      @request.save!
      flash[:success] = "Welcome to Coworking! Your email has been confirmed."
      UserMailer.three_month_mail(@request).deliver_later(wait_until: 3.months.from_now)
      redirect_to requests_path
    else
      flash[:error] = "Sorry. A problem has appeared"
      redirect_to root_path
    end
  end

  def reconfirm_email
    @request = Request.find_by_confirm_token(params[:token])
    if @request
      @request.statut = 'confirmed'
      @request.save!
      UserMailer.three_month_mail(@request).deliver_later(wait_until: 3.months.from_now)
      redirect_to request_path(@request)
    else
      flash[:error] = "Sorry. A problem has appeared"
      redirect_to root_path
    end
  end

  def unconfirm_email
    @request = Request.find_by_confirm_token(params[:token])
    if @request
      @request.statut = 'expired'
      @request.save!
    else
      flash[:error] = "Sorry. A problem has appeared"
    end
    redirect_to root_path
  end

  private

  def request_params
    params.require(:request).permit(:name, :email, :phone_number, :biography)
  end
end
