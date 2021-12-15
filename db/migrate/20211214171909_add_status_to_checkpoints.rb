class AddStatusToCheckpoints < ActiveRecord::Migration[6.1]
  def change
    add_column :checkpoints, :checked, :boolean
  end
end
