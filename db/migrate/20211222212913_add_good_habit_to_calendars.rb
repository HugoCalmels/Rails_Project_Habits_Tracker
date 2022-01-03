class AddGoodHabitToCalendars < ActiveRecord::Migration[6.1]
  def change
    add_reference :calendars, :good_habit, foreign_key: true
    add_reference :calendars, :bad_habit, foreign_key: true
  end
end
