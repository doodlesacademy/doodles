class CreateAssetables < ActiveRecord::Migration
  def change
    create_table :assetables do |t|
      t.integer :asset_id
      t.references :assetable, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
