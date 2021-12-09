class AddUserAndCycleToGoodHabits < ActiveRecord::Migration[6.1]
  def change
    add_reference :good_habits, :user, foreign_key: true
    add_reference :good_habits, :cycle, foreign_key: true
  end
end
