class AddGoodAndBadHabitsToStats < ActiveRecord::Migration[6.1]
  def change
    add_reference :stats, :good_habit, foreign_key: true
    add_reference :stats, :bad_habit, foreign_key: true
  end
end
