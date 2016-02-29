class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :sectionable_id
      t.string :sectionable_type
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
