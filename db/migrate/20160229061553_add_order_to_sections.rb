class AddOrderToSections < ActiveRecord::Migration
  def change
    add_column :sections, :order, :integer, default: 0
  end
end
