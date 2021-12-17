class ApplicationController < ActionController::Base

  add_flash_types :danger, :info, :warning, :success
  
  def after_sign_in_path_for(resource)
    user_cycles_path(current_user.id)
  end

  def after_sign_up_path_for(resource)
    user_cycles_path(current_user.id)
  end
end
