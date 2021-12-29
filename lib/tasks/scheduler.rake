namespace :scheduled_tasks do
  desc "daily checkpoints reset + creating stats"
  task update: :environment do
    User.all.each do |user|
      user.good_habits.where(cycle_id: 1).each do |habit|
        cycle_success_total = 0
        cycle_failed_total = 0
        habit.checkpoints.each do |checkpoint|
          if checkpoint.checked 
            cycle_success_total += 1
            checkpoint.destroy
          else
            cycle_failed_total += 1
            checkpoint.destroy
          end
        end
        Stat.create(
            date: DateTime.current.to_date,
            cycle_result_success: cycle_success_total,
            cycle_result_failed: cycle_failed_total,
            calendar: habit.calendar
          )
          habit.announced_checkpoints.times do
            habit.checkpoints.create(good_habit_id: habit.id)
          end
      end
     
    end
    puts "%%%%%%%%%%%%%%%%"
    puts "Daily cycle updated"
    puts "%%%%%%%%%%%%%%%%"
  

    if (Date.today.strftime("%A") == "Monday")
      User.all.each do |user|
        user.good_habits.where(cycle_id: 2).each do |habit|
          cycle_success_total = 0
          cycle_failed_total = 0
          habit.checkpoints.each do |checkpoint|
            if checkpoint.checked 
              cycle_success_total += 1
              checkpoint.destroy
            else
              cycle_failed_total += 1
              checkpoint.destroy
            end
          end
          Stat.create(
              date: DateTime.current.to_date,
              cycle_result_success: cycle_success_total,
              cycle_result_failed: cycle_failed_total,
              calendar: habit.calendar
            )
            habit.announced_checkpoints.times do
              habit.checkpoints.create(good_habit_id: habit.id)
            end
        end
      end
      puts "%%%%%%%%%%%%%%%%"
      puts "Weekly cycle updated"
      puts "%%%%%%%%%%%%%%%%"
  
    end


    if (Date.today.strftime("%C") == "1")
      User.all.each do |user|
        user.good_habits.where(cycle_id: 3).each do |habit|
          cycle_success_total = 0
          cycle_failed_total = 0
          habit.checkpoints.each do |checkpoint|
            if checkpoint.checked 
              cycle_success_total += 1
              checkpoint.destroy
            else
              cycle_failed_total += 1
              checkpoint.destroy
            end
          end
          Stat.create(
              date: DateTime.current.to_date,
              cycle_result_success: cycle_success_total,
              cycle_result_failed: cycle_failed_total,
              calendar: habit.calendar
            )
            habit.announced_checkpoints.times do
              habit.checkpoints.create(good_habit_id: habit.id)
            end
        end
      end
      puts "%%%%%%%%%%%%%%%%"
      puts "Monthly cycle updated"
      puts "%%%%%%%%%%%%%%%%"
    end

    puts "%%%%%%%%%%%%%%%%"
    puts "Schedule end"
    puts "%%%%%%%%%%%%%%%%"
  
  end
end