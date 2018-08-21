class AddMaterialLinkToProducts < ActiveRecord::Migration
  def change
    add_column :products, :material_link, :string
  end
end
