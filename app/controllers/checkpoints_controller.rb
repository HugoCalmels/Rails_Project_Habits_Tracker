class CheckpointsController < ApplicationController
  before_action :find_good_habit

  def create
    puts "mmMMMMMmmmMMm"
    puts params
    puts "mmMMMMMmmmMMm"
    @good_habit.checkpoints.create(good_habit_id: current_user.id)
    ## redirect_to user_cycle_good_habits_path(params[:user_id], params[:cycle_title])
  end

  def update
  
    @checkpoint = Checkpoint.find(params[:id])
    @checkpoint = Checkpoint.find(params[:id])
    if @checkpoint.checked == false 
      @checkpoint.checked = true
    elsif @checkpoint.checked == true
      @checkpoint.checked = false
    end

    @checkpoint.save!

    respond_to do |format|
      format.html { redirect_to user_cycle_good_habits_path(params[:user_id], params[:cycle_title]) }
      format.js { }
    end

    ## redirect_to user_cycle_good_habits_path(params[:user_id], params[:cycle_title])
  end

  def destroy
    puts "mmMMMMMmmmMMm"
    puts params[:id]
    puts "mmMMMMMmmmMMm"
    @checkpoint =  @good_habit.checkpoints.find_by(id: params[:id])
    @checkpoint.destroy
    redirect_to user_cycle_good_habits_path(params[:user_id], params[:cycle_title])
  end
  
  private
  def find_good_habit
    puts "mmMMMMMmmmMMm"
    puts params
    puts "mmMMMMMmmmMMm"
    @good_habit = GoodHabit.find(params[:good_habit_id])
  end

end
