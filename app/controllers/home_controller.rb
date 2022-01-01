class HomeController < ApplicationController
  def index
    if user_signed_in? 
      redirect_to user_cycles_path(current_user.id)
    else
      redirect_to new_user_session_path
    end

  end

  def how_it_works 

  end

  def about
  end

  def redirect 
    if user_signed_in? 
      redirect_to user_cycles_path(current_user.id)
    else
      redirect_to how_it_works_path
    end
  end
end
