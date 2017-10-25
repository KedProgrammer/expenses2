class CreateCategoryes < ActiveRecord::Migration[5.0]
  def change
    create_table :categoryes do |t|
      t.string :name

      t.timestamps
    end
  end
end
