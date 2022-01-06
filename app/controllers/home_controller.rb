class HomeController < ApplicationController
  def index
    authenticate_user!
    puts "DOES AM IN INDEX??"
    puts "DOES AM IN INDEX??"
    puts "DOES AM IN INDEX??"
    puts "DOES AM IN INDEX??"
    puts "DOES AM IN INDEX??"
    puts "DOES AM IN INDEX??"
    puts "DOES AM IN INDEX??"

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
    authenticate_user!
    if user_signed_in? 
      redirect_to user_cycles_path(current_user.id)
    else
      redirect_to how_it_works_path
    end
  end

  
  
end
