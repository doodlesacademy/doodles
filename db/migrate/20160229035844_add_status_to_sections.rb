class AddStatusToSections < ActiveRecord::Migration
  def change
    add_column :sections, :status, :integer
  end
end
