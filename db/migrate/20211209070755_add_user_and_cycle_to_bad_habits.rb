class AddUserAndCycleToBadHabits < ActiveRecord::Migration[6.1]
  def change
    add_reference :bad_habits, :user, foreign_key: true
    add_reference :bad_habits, :cycle, foreign_key: true
  end
end
