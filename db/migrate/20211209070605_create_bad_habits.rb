class CreateBadHabits < ActiveRecord::Migration[6.1]
  def change
    create_table :bad_habits do |t|
      t.string :title
      t.integer :announced_checkpoints

      t.timestamps
    end
  end
end
