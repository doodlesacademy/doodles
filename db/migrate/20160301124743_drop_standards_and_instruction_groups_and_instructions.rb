class DropStandardsAndInstructionGroupsAndInstructions < ActiveRecord::Migration
  def change
    drop_table :standards
    drop_table :instruction_groups
    drop_table :instructions
  end
end
