class RegistrationsController < Devise::RegistrationsController

  private

  def after_sign_up_path_for(resource)
      dashboard_index_path(resource)
  end

  # def after_update_path_for(resource)
  #   signed_in_root_path(resource)
  # end

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end

end