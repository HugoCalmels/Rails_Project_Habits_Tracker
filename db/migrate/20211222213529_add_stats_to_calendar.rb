class AddStatsToCalendar < ActiveRecord::Migration[6.1]
  def change
    add_reference :stats, :calendar, foreign_key: true
  end
end
