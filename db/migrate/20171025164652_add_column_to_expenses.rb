class AddColumnToExpenses < ActiveRecord::Migration[5.0]
  def change
    add_reference :expenses, :type, foreign_key: true
    add_reference :expenses, :categorye, foreign_key: true
  end
end
