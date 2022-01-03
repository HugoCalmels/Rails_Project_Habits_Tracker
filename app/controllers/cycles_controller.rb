class CyclesController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index, :reset, :admin]
  def index
    if user_signed_in? 
      @cycles = Cycle.all
    @user = User.find(params[:user_id])
    if @user.id != current_user.id
      redirect_to root_path, alert: "You not allowed to do that !"
      end
    else
      redirect_to how_it_works_path
    end
  end

  def show
    @cycle = Cycle.find_by(title: params[:title])
    @user = User.find(params[:user_id])
    if @user.id != current_user.id
      redirect_to root_path, alert: "You not allowed to do that !"
    end
  end

  

  def reset
    if params[:format] == 'good_habit'

    @cycle = Cycle.find_by(title: params[:cycle_title])
    @user = User.find(params[:user_id])
    @good_habits = GoodHabit.where(cycle_id: @cycle.id, user_id: @user.id)
    if @user.state == 'unactive'
      redirect_to user_cycle_good_habits_path(params[:user_id], params[:cycle_title]), alert:"Your account is in sleep mode"
      return
    end
    if !@good_habits[0].nil?
      @good_habits.map do |habit|
        cycle_success_total = 0
        cycle_failed_total = 0
        habit.checkpoints.map do |checkpoint|
          if checkpoint.checked 
            cycle_success_total += 1
            checkpoint.destroy
          else
            cycle_failed_total += 1
            checkpoint.destroy
          end
        end
        @stat = Stat.new(
          cycle_result_failed: cycle_failed_total,
          cycle_result_success: cycle_success_total,
          calendar: habit.calendar,
          date: DateTime.current.to_date
        )
        @stat.save!
        habit.announced_checkpoints.times do
          habit.checkpoints.create(good_habit_id: habit.id)
        end
      end
      flash[:notice] = "Your checkpoints were reset and saved !"
      redirect_to user_cycle_stats_path(params[:user_id], params[:cycle_title], 'good_habit')
      return
    elsif @good_habits[0].nil?
      redirect_to user_cycle_good_habits_path(params[:user_id], params[:cycle_title]), alert:"Need minimum 1x habit to simulate"
      return
    end

    elsif params[:format] == 'bad_habit'
      @cycle = Cycle.find_by(title: params[:cycle_title])
    @user = User.find(params[:user_id])
    @bad_habits = BadHabit.where(cycle_id: @cycle.id, user_id: @user.id)
    if @user.state == 'unactive'
      redirect_to user_cycle_bad_habits_path(params[:user_id], params[:cycle_title]), alert:"Your account is in sleep mode"
      return
    end
    if !@bad_habits[0].nil?
      @bad_habits.map do |habit|
        cycle_success_total = 0
        cycle_failed_total = 0
        habit.checkpoints.map do |checkpoint|
          if checkpoint.checked 
            cycle_success_total += 1
            checkpoint.destroy
          else
            cycle_failed_total += 1
            checkpoint.destroy
          end
        end
        @stat = Stat.new(
          cycle_result_failed: cycle_failed_total,
          cycle_result_success: cycle_success_total,
          calendar: habit.calendar,
          date: DateTime.current.to_date
        )
        @stat.save!
        habit.announced_checkpoints.times do
          habit.checkpoints.create(bad_habit_id: habit.id)
        end
      end
      flash[:notice] = "Your checkpoints were reset and saved !"
      redirect_to user_cycle_stats_path(params[:user_id], params[:cycle_title], 'bad_habit')
      return
    elsif @bad_habits[0].nil?
      redirect_to user_cycle_bad_habits_path(params[:user_id], params[:cycle_title]), alert:"Need minimum 1x habit to simulate"
      return
    end
    end

  end

end
