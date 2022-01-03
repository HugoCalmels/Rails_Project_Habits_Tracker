class CheckpointsController < ApplicationController


  def create
    if params[:controller] == 'good_habits' 
      @good_habit.checkpoints.create(good_habit_id: current_user.id)
    elsif params[:controller] == 'bad_habits'
      @bad_habit.checkpoints.create(bad_habit_id: current_user.id)
    end
  end

  def update
    if !params[:good_habit_id].nil?
      find_good_habit
    elsif !params[:bad_habit_id].nil?
      find_bad_habit
    end
    @checkpoint = Checkpoint.find(params[:id])
    if @checkpoint.checked == false 
      @checkpoint.checked = true
    elsif @checkpoint.checked == true
      @checkpoint.checked = false
    end
    @checkpoint.save
    if !params[:good_habit_id].nil? 
    respond_to do |format|
      format.html { redirect_to user_cycle_good_habits_path(params[:user_id], params[:cycle_title]) }
      format.js { }
    end
  elsif !params[:bad_habit_id].nil?
      respond_to do |format|
        format.html { redirect_to user_cycle_bad_habits_path(params[:user_id], params[:cycle_title]) }
        format.js { }
    end
  end
 
  end

  def destroy
    puts params[:id]
    @checkpoint =  @good_habit.checkpoints.find_by(id: params[:id])
    @checkpoint.destroy
    redirect_to user_cycle_good_habits_path(params[:user_id], params[:cycle_title])
  end
  
  private
  def find_bad_habit
    @bad_habit = BadHabit.find(params[:bad_habit_id])
  end

  def find_good_habit
    @good_habit = GoodHabit.find(params[:good_habit_id])
  end

end
