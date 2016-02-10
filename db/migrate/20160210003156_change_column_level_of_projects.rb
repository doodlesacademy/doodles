class ChangeColumnLevelOfProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :level
    add_column :projects, :level, :int
  end
end
