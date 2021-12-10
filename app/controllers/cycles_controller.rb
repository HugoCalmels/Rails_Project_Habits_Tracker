class CyclesController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index]
  def index
    @cycles = Cycle.all
    @user = User.find(params[:user_id])
  end

  def show
    @cycle = Cycle.find_by(title: params[:title])
    @user = User.find(params[:user_id])
  end


    def stats
      @cycle = Cycle.find_by(title: params[:cycle_title])
      @user = User.find(params[:user_id])
      @good_habits = GoodHabit.where(cycle_id: @cycle.id, user_id: @user.id)
      @bad_habits = BadHabit.where(cycle_id: @cycle.id, user_id: @user.id)
    end

end
