class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :item_name,            null: false
      t.text    :item_description,     null: false
      t.integer :category_id ,         null: false 
      t.integer :product_condition_id, null: false
      t.integer :shipping_cost_id,     null: false
      t.integer :prefecture_id,        null: false
      t.integer :delivery_date_id,     null: false
      t.string  :price,                null: false
      t.references :user,              null: false, foreign_key: true
      
      t.integer    :genre_id     , null: false
      t.timestamps
    end
  end
end
