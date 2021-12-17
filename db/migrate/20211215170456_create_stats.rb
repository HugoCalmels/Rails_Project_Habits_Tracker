class CreateStats < ActiveRecord::Migration[6.1]
  def change
    create_table :stats do |t|
      t.date :date
      t.integer :cycle_result_success
      t.integer :cycle_result_failed
      t.integer :total_result_success
      t.integer :total_result_failed

      t.timestamps
    end
  end
end
