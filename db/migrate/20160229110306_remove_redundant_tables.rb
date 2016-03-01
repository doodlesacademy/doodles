class RemoveRedundantTables < ActiveRecord::Migration
  def change
    drop_table :admin_pages, if_exists: true
    drop_table :admin_projects, if_exists: true
    drop_table :admin_lessons, if_exists: true
    drop_table :admin_standards, if_exists: true
    drop_table :admin_members, if_exists: true
    drop_table :admin_galleries, if_exists: true
  end
end
