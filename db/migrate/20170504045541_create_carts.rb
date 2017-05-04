class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.string :item_name
      t.float :price
      t.integer :quantity
      t.integer :food_id
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
