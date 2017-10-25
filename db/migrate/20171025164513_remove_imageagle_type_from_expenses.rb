class RemoveImageagleTypeFromExpenses < ActiveRecord::Migration[5.0]
  def change
    remove_column :expenses, :imageable_type, :string
  end
end
