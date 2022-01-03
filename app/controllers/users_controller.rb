class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update 
    @user = current_user
    if @user.state == 'active'
      @user.state = 'unactive'
      @user.save
      redirect_back fallback_location: root_path, warning: 'Your account has been unactivated, means no more stats recorded'
      return
    elsif @user.state == 'unactive'
      @user.state = 'active'
      @user.save
      redirect_back fallback_location: root_path, notice: 'Your account has been re-activated'
      return
    end
  end

  def admin
    @user = User.find(params[:user_id])
    if @user.is_admin == true
    @users = User.all
    @messages = Message.all
    else
      redirect_to root_path, alert: 'You must be an admin'
    end
  end


  def destroy
    @user = User.find(params[:id])
  
    if @user.destroy
      redirect_to user_admin_path(current_user.id), notice: "User deleted."
    else
      redirect_to user_admin_path(current_user.id), alert: "User could not be deleted." 
    end
  end
  
end
