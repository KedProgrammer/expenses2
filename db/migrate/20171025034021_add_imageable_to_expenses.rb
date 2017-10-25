class AddImageableToExpenses < ActiveRecord::Migration[5.0]
  def change
    add_reference :expenses, :imageable, polymorphic: true, index: true
  end
end
