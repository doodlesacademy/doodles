class RemoveRedundantTables < ActiveRecord::Migration
  def change
    drop_table :admin_pages
    drop_table :admin_projects
    drop_table :admin_lessons
    drop_table :admin_standards
    drop_table :admin_members
    drop_table :admin_galleries
  end
end
