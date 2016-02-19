class CreateInstructionGroups < ActiveRecord::Migration
  def change
    create_table :instruction_groups do |t|
      t.integer :lesson_id
      t.integer :order
      t.string :title

      t.timestamps null: false
    end
  end
end
