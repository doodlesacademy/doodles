class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.integer :instruction_group_id
      t.string :time_to_complete
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
