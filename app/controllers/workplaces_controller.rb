class WorkplacesController < ApplicationController
  before_action :check_user_admin, only: [:new, :create, :edit, :update, :destroy]
  def index
    @workplaces = Workplace.all
  end

  def new
    @workplace = Workplace.new
  end

  def create
    @workplace = Workplace.create(workplace_params)
    redirect_to request_path(@workplace)
  end

  def show
    @workplace = find
  end

  def edit
    @workplace = find
  end

  def update
    @workplace = find
    @workplace.update(workplace_params)
    redirect_to request_path(@workplace)
  end

  def destroy
    @workplace = find
    @workplace.destroy
    redirect_to requests_path
  end

  private

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
    params.require(:workplace).permit(:name, :total_places, :available_places)
  end
end
