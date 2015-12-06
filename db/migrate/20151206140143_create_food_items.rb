class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :section
      t.string :imgurl

      t.timestamps null: false
    end
  end
end
