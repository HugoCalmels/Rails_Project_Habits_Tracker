class GoodHabitsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @cycle = Cycle.find_by(title: params[:cycle_title])
    @user = User.find(params[:user_id])
    @good_habits = GoodHabit.where(cycle_id: @cycle.id, user_id: @user.id)
    @good_habits.sort_by {|obj| obj.id}
    if @user.id != current_user.id
      redirect_to root_path, alert: "You not allowed to do that !"
    end
  end

  def show
  end

  def new
    @cycle = Cycle.find_by(title: params[:cycle_title])
    @user = User.find(params[:user_id])
    @good_habit  = GoodHabit.new
    if @user.id != current_user.id
      redirect_to root_path, alert: "You not allowed to do that !"
    end
  end

  def create
    @cycle = Cycle.find_by(title: params[:cycle_title])
    @user = User.find(params[:user_id])
    @good_habit  = GoodHabit.new(good_habit_params)
    @good_habit.user = @user
    @good_habit.cycle = @cycle
    if @user.id != current_user.id
      redirect_to root_path, alert: "You not allowed to do that !"
      end
    if @good_habit.save
      @calendar = Calendar.create
      @good_habit.calendar = @calendar
      @good_habit.announced_checkpoints.times do
      @good_habit.checkpoints.create(good_habit_id: @good_habit.id) 
    end
      redirect_to user_cycle_good_habits_path(@user.id, @cycle.title), notice: "habit created !"
    else 
      redirect_to new_user_cycle_good_habit_path(@user.id, @cycle.title), alert: @good_habit.errors.full_messages
    end
  end

  def edit
  end

  def update
    @good_habit = GoodHabit.find(params[:id])
    if @good_habit.update(good_habit_params)
      redirect_to user_cycle_good_habits_path(params[:user_id], params[:cycle_title]), notice: "Habit updated !"
      return
    else 
      redirect_to user_cycle_good_habits_path(params[:user_id], params[:cycle_title]), alert: @good_habit.errors.full_messages
    end
  end

  def destroy
    @good_habit = GoodHabit.find(params[:id])
    if @good_habit.title.capitalize == params[:good_habit][:title] ||@good_habit.title == params[:good_habit][:title]
      @good_habit.destroy
      redirect_to user_cycle_good_habits_path(params[:user_id], params[:cycle_title]) , notice: "Habit destroyed !"
      return
    else
      redirect_to user_cycle_good_habits_path(params[:user_id], params[:cycle_title]), alert: "Error : habit title do not match"
    end
  end

  private
  def good_habit_params
    params.require(:good_habit).permit(:title, :announced_checkpoints)
  end

end

