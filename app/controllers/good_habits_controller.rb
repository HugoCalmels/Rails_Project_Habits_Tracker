class GoodHabitsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @cycle = Cycle.find_by(title: params[:cycle_title])
    @user = User.find(params[:user_id])
    @good_habits = GoodHabit.where(cycle_id: @cycle.id, user_id: @user.id)
    puts "MmmmmmmmmmmmmmmzdADIIIIIIIIIIIIIIIIIIIIIIIII"
    @good_habits.sort_by {|obj| obj.id}
    puts "MmmmmmmmmmmmmmmzdADIIIIIIIIIIIIIIIIIIIIIIIII"

  end

  def show
  end

  def new
    @cycle = Cycle.find_by(title: params[:cycle_title])
    @user = User.find(params[:user_id])
    @good_habit  = GoodHabit.new
  end

  def create
    @cycle = Cycle.find_by(title: params[:cycle_title])
    @user = User.find(params[:user_id])
    @good_habit  = GoodHabit.new(good_habit_params)
    @good_habit.user = @user
    @good_habit.cycle = @cycle
    if @good_habit.save!
      @good_habit.announced_checkpoints.times do
        @good_habit.checkpoints.create(good_habit_id: @good_habit.id)
      end
    redirect_to user_cycle_good_habits_path(@user.id, @cycle.title)
    else 
      render "new"
    end
  end

  def edit
  end

  def update
    puts "MMMMMMMMMMMMMMMMM"
    puts params
    puts "MMMMMMMMMMMMMMMMM"
    @good_habit = GoodHabit.find(params[:id])
    puts "checkpoints : " + @good_habit.checkpoints.to_s
    puts "successed checkpoints :" + @good_habit.successed_checkpoints.to_s
  
    if @good_habit.increment!(:successed_checkpoints)
      redirect_to user_cycle_good_habits_path(params[:user_id], params[:cycle_title])
    end

  end

  def destroy
  end

 

  private

  def good_habit_params
    puts "MMMMMMMMMMMMMMMM"
    puts params
    puts "MMMMMMMMMMMMMMMMM"
    params.require(:good_habit).permit(:title, :announced_checkpoints)
  end

end

