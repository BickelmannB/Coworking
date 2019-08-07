class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # after_action :check_changed_pass

  def configure_permitted_parameters
    update_attrs = [:password, :password_confirmation]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end

  private

  def check_changed_pass
    @user = current_user
      if @user && @user.password_changed.nil? #make sure user has changed their password before accessing internal pages
        redirect_to user_password_path
        return false
      else
        return
      end
  end
    # def check_pass_changed
  #   @exclude_action = [["edit", "devise/password"], ["passwords#update", "devise"], ["sessions#destroy", "devise"],
  #                      ["sessions#new", "devise"], ["passwords#update", "devise"], ["sessions#create", "devise"],
  #                      ["passwords#new", "devise"], ["passwords#create", "devise"], ["home", "pages"]]

  #   if current_user &.already_logged == false && @exclude_action.find { |act| act[0] == self.action_name && act[1] == self.controller_name } == nil
  #     redirect_to edit_user_password_path, method: :get

  #   return false
  #   end
  # end
end
