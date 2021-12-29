class CyclesController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index]
  def index

    if user_signed_in? 
      @cycles = Cycle.all
    @user = User.find(params[:user_id])
    else
      redirect_to how_it_works_path
    end

  end

  def show
    @cycle = Cycle.find_by(title: params[:title])
    @user = User.find(params[:user_id])
  end


    def stats
      @cycle = Cycle.find_by(title: params[:cycle_title])
      @user = User.find(params[:user_id])
      @good_habits = GoodHabit.where(cycle_id: @cycle.id, user_id: @user.id)
      @bad_habits = BadHabit.where(cycle_id: @cycle.id, user_id: @user.id)
    end

    def reset
      puts "MMMMMMMMMM"
      puts "we reached the reset method !"
      puts "MMMMMMMMMM"
      @cycle = Cycle.find_by(title: params[:cycle_title])
      @user = User.find(params[:user_id])
      @good_habits = GoodHabit.where(cycle_id: @cycle.id, user_id: @user.id)



      puts "MMMMMMMMMM"
      puts "we starting to code here !"
      puts "MMMMMMMMMM"

      
      @good_habits.map do |habit|
        cycle_success_total = 0
      cycle_failed_total = 0
        
        puts "habit title : " + habit.title
        puts "announced checkpoints : " + habit.announced_checkpoints.to_s
        habit.checkpoints.map do |checkpoint|
          if checkpoint.checked 
       
            cycle_success_total += 1
            checkpoint.destroy
          else
        
            cycle_failed_total += 1
            checkpoint.destroy
          end
          puts " bug ici 1?"
        end
        puts "failed total is "
        puts cycle_failed_total
        puts "success total is"
        puts cycle_success_total
        @stat = Stat.new(
          cycle_result_failed: cycle_failed_total,
          cycle_result_success: cycle_success_total,
          calendar: habit.calendar,
          date: DateTime.current.to_date
        )
        if @stat.save
          puts "SSSSSSSSSSSSSSSSAVED"
        else
          puts @save.errors.full_messages
        end
        habit.announced_checkpoints.times do
          habit.checkpoints.create(good_habit_id: habit.id)
        end


      end

      



    end

end
