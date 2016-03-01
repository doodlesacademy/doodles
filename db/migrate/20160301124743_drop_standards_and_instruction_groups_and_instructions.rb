class DropStandardsAndInstructionGroupsAndInstructions < ActiveRecord::Migration
  def change
    if ActiveRecord::Base.connection.table_exists? :standards
      drop_table :standards
    end

    if ActiveRecord::Base.connection.table_exists? :instruction_groups
      drop_table :instruction_groups
    end

    if ActiveRecord::Base.connection.table_exists? :instructions
      drop_table :instructions
    end
  end
end
