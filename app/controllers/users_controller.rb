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
  
end
