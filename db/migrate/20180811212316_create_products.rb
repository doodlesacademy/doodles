class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :sku, null: false
      t.string :image_url, null: false
      t.text :description, null: false

      t.timestamps null: false
    end
  end
end
