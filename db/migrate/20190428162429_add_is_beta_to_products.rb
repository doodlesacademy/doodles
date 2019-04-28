class AddIsBetaToProducts < ActiveRecord::Migration
  def change
    add_column :products, :beta, :boolean, default: false
  end
end
