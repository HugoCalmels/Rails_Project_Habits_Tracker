class StatsController < ApplicationController
  def index

    puts "MMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    puts "MMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    puts "MMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    puts params[:format]
    puts params[:format]
    puts params[:format]
    puts "MMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    puts "MMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    puts "MMMMMMMMMMMMMMMMMMMMMMMMMMMMM"

    @cycle = Cycle.find_by(title: params[:cycle_title])
    @user = User.find(params[:user_id])

    if params[:format] == 'good_habit'
      @good_habits = GoodHabit.where(cycle_id: @cycle.id, user_id: @user.id)
    elsif  params[:format] == 'bad_habit'
      @bad_habits = BadHabit.where(cycle_id: @cycle.id, user_id: @user.id)
    end
  end

  def new
  end

  def create
  end

  def show
    @stat = Stat.find_by(id: params[:id])
    @cycle = Cycle.find_by(title: params[:cycle_title])
    @user = User.find(params[:user_id])
  end
end
