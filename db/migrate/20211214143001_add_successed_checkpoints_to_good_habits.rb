class AddSuccessedCheckpointsToGoodHabits < ActiveRecord::Migration[6.1]
  def change
    add_column :good_habits, :successed_checkpoints, :integer
    add_column :bad_habits, :successed_checkpoints, :integer
  end
end
