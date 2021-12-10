class BadHabitsController < ApplicationController
  before_action :authenticate_user!
  def index
    puts params[:user_id]
    puts params[:cycle_title]
    @cycle = Cycle.find_by(title: params[:cycle_title])
    @user = User.find(params[:user_id])

    BadHabit.create(
      title: "from the controller",
      checkpoints: 1,
      user: @user,
      cycle: @cycle
    )
    puts "%%%%%%%%%%%%"

    @bad_habits = BadHabit.where(cycle_id: @cycle.id, user_id: @user.id)

  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
end

# JE VUEX CA !!
# @attendance = current_event.attendances.find_by(user: current_user)