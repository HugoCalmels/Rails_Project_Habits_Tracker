class CreateCheckpoints < ActiveRecord::Migration[6.1]
  def change
    create_table :checkpoints do |t|
      t.references :good_habit, foreign_key: true
      t.references :bad_habit, foreign_key: true

      t.timestamps
    end
  end
end
