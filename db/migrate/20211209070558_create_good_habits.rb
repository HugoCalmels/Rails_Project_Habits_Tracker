class CreateGoodHabits < ActiveRecord::Migration[6.1]
  def change
    create_table :good_habits do |t|
      t.string :title
      t.integer :announced_checkpoints

      t.timestamps
    end
  end
end
