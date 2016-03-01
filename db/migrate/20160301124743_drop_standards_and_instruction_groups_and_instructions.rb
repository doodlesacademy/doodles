class DropStandardsAndInstructionGroupsAndInstructions < ActiveRecord::Migration
  def change
    drop_table :standards, if_exists: true
    drop_table :instruction_groups, if_exists: true
    drop_table :instructions, if_exists: true
  end
end
