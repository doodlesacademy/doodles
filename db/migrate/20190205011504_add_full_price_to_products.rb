class AddFullPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :full_price, :integer
  end
end
