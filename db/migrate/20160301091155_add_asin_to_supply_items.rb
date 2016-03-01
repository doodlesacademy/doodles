class AddAsinToSupplyItems < ActiveRecord::Migration
  def change
    add_column :supply_items, :asin, :string
  end
end
