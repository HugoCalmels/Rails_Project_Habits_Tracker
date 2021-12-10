class GoodHabitsController < ApplicationController
  before_action :authenticate_user!
  def index
    puts params[:user_id]
    puts params[:cycle_title]
    @cycle = Cycle.find_by(title: params[:cycle_title])
    @user = User.find(params[:user_id])

    GoodHabit.create(
      title: "from the controller",
      checkpoints: 1,
      user: @user,
      cycle: @cycle
    )
    puts "%%%%%%%%%%%%"

    @good_habits = GoodHabit.where(cycle_id: @cycle.id, user_id: @user.id)

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
    puts "%%%%%%%%%%%%%%%"
    puts params
    puts "%%%%%%%%%%%%%%%"
    @good_habit  = GoodHabit.new(good_habit_params)
    @good_habit.user = @user
    @good_habit.cycle = @cycle
    if @good_habit.save!
    redirect_to user_cycle_good_habits_path(@user.id, @cycle.title)
    else 
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end



  private
  

    # Only allow a list of trusted parameters through.
    def good_habit_params
      params.require(:good_habit).permit(:title, :checkpoints)
    end

end

