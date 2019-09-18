class WorkplacesController < ApplicationController
  before_action :check_user_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :cookie_user

  def index
    workplaces
  end


  def new
    @workplace = Workplace.new
  end

  def create
    @workplace = Workplace.create(workplace_params)
    redirect_to workplace_path(@workplace)
  end

  def show
    @workplace = find
    @reservations = Reservation.where("workplace_id = :id", id: @workplace.id)
  end

  def edit
    @workplace = find
  end

  def update
    @workplace = find
    @workplace.update(workplace_params)
    redirect_to workplace_path(@workplace)
  end

  def destroy
    @workplace = find
    @workplace.destroy
    redirect_to workplaces_path
  end

  def load_wp
    workplaces
    render layout: false
  end

  def export_files
    @workplaces = Workplace.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workplaces }
      format.xlsx {
        xlsx_package = @workplaces.to_xlsx
        begin
          temp = Tempfile.new("workplaces.xlsx")
          xlsx_package.serialize temp.path
          send_file temp.path, filename: "workplaces.xlsx", type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        ensure
          temp.close
          temp.unlink
        end
      }
    end
  end

  private

  def workplaces
    @workplaces = Workplace.all
    @workplaces = @workplaces.where("description ILIKE ?", "%#{cookies[:search]}%") if cookies[:search].present? && params[:search] != ""
    @workplaces = @workplaces.order(total_places: :desc) if params[:tri].present? && params[:tri] == "desc"
    @workplaces = @workplaces.order(total_places: :asc) if params[:tri].present? && params[:tri] == "asc"
  end

  def cookie_user
    cookies[:search] = { value: params[:search].to_s, expires: 24.hour } if params[:search].present?
    return
  end

  def check_user_admin
    if current_user &.admin?
      return true
    else
      redirect_to root_path, alert: 'Sorry, Workspaces management is reserved for admins'
      return false
    end
  end

  def find
    Workplace.find(params[:id])
  end

  def workplace_params
    params.require(:workplace).permit(:name, :total_places, :description, :photo, :photo_cache)
  end
end
