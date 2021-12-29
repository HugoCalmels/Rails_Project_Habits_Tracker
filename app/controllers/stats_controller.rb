class StatsController < ApplicationController
  def index
    @cycle = Cycle.find_by(title: params[:cycle_title])
    @user = User.find(params[:user_id])
    @good_habits = GoodHabit.where(cycle_id: @cycle.id, user_id: @user.id)
    @bad_habits = BadHabit.where(cycle_id: @cycle.id, user_id: @user.id)
  end

  def new
  end

  def create
  end

  def show
    puts params
    @stat = Stat.find_by(id: params[:id])
    @cycle = Cycle.find_by(title: params[:cycle_title])
    @user = User.find(params[:user_id])
  end
end
