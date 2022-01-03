class BadHabitsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @cycle = Cycle.find_by(title: params[:cycle_title])
    @user = User.find(params[:user_id])
    @bad_habits = BadHabit.where(cycle_id: @cycle.id, user_id: @user.id)
    @bad_habits.sort_by {|obj| obj.id}
    if @user.id != current_user.id
      redirect_to root_path, alert: "You not allowed to do that !"
    end
  end

  def show
  end

  def new
    @cycle = Cycle.find_by(title: params[:cycle_title])
    @user = User.find(params[:user_id])
    @bad_habit  = BadHabit.new
    if @user.id != current_user.id
      redirect_to root_path, alert: "You not allowed to do that !"
    end
  end

  def create
    @cycle = Cycle.find_by(title: params[:cycle_title])
    @user = User.find(params[:user_id])
    @bad_habit  = BadHabit.new(bad_habit_params)
    @bad_habit.user = @user
    @bad_habit.cycle = @cycle
    if @user.id != current_user.id
      redirect_to root_path, alert: "You not allowed to do that !"
      end
    if @bad_habit.save
      @calendar = Calendar.create
      @bad_habit.calendar = @calendar
      @bad_habit.announced_checkpoints.times do
      @bad_habit.checkpoints.create(bad_habit_id: @bad_habit.id) 
    end
      redirect_to user_cycle_bad_habits_path(@user.id, @cycle.title), notice: "habit created !"
    else 
      redirect_to new_user_cycle_bad_habit_path(@user.id, @cycle.title), alert: @bad_habit.errors.full_messages
    end
  end

  def edit
  end

  def update
    @bad_habit = BadHabit.find(params[:id])
    if @bad_habit.update(bad_habit_params)
      redirect_to user_cycle_bad_habits_path(params[:user_id], params[:cycle_title]), notice: "Habit updated !"
      return
    else 
      redirect_to user_cycle_bad_habits_path(params[:user_id], params[:cycle_title]), alert: @bad_habitt.errors.full_messages
    end
  end

  def destroy
    @bad_habit = BadHabit.find(params[:id])
    if @bad_habit.title.capitalize == params[:bad_habit][:title] ||@bad_habit.title == params[:bad_habit][:title]
      @bad_habit.destroy
      redirect_to user_cycle_bad_habits_path(params[:user_id], params[:cycle_title]) , notice: "Habit destroyed !"
      return
    else
      redirect_to user_cycle_bad_habits_path(params[:user_id], params[:cycle_title]), alert: "Error : habit title do not match"
    end
  end

  private
  def bad_habit_params
    params.require(:bad_habit).permit(:title, :announced_checkpoints)
  end

end

