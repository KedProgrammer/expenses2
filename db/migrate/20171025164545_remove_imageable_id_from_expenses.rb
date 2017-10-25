class RemoveImageableIdFromExpenses < ActiveRecord::Migration[5.0]
  def change
    remove_column :expenses, :imageable_id, :integer
  end
end
