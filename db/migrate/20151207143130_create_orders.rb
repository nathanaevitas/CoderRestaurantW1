class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.integer :food_item_id

      t.timestamps null: false
    end
  end
end
