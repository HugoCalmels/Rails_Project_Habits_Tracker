class CreateCycles < ActiveRecord::Migration[6.1]
  def change
    create_table :cycles do |t|
      t.string :title

      t.timestamps
    end
  end
end
