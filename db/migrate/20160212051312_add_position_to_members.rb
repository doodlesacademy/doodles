class AddPositionToMembers < ActiveRecord::Migration
  def change
    add_column :members, :position, :string
  end
end
