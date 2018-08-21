class AddSubtitleToProducts < ActiveRecord::Migration
  def change
    add_column :products, :subtitle, :string
  end
end
