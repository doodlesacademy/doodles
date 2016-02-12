class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :fingerprint, null: false
      t.string :name
      t.string :url
      t.string :extension
      t.integer :size
      t.integer :type

      t.timestamps null: false
    end
  end
end
