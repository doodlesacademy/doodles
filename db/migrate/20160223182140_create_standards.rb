class CreateStandards < ActiveRecord::Migration
  def change
    create_table :standards do |t|
      t.integer :project_id
      t.text :common_core
      t.text :national_core
      t.text :art_elements
      t.text :art_principles
      t.text :cross_curricular

      t.timestamps null: false
    end
  end
end
