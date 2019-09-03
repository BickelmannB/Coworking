class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_pass_changed


  def configure_permitted_parameters
    update_attrs = [:password, :password_confirmation]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end

  private

  def check_pass_changed
    @exclude_action = [["edit", "passwords"], ["update", "passwords"], ["destroy", "sessions"],
                       ["new", "sessions"], ["update", "passwords"], ["create", "sessions"],
                       ["new", "passwords"], ["create", "passwords"], ["home", "pages"],
                       ["edit", "registrations"], ["update", "registrations"]]
    if current_user && current_user.already_logged == false && @exclude_action.find { |act| act[0] == self.action_name && act[1] == self.controller_name } == nil
      redirect_to edit_user_registration_path
      return false
    else
      return
    end
  end
end
