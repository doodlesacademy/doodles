class AddMoreColumnsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :photocopy, :text
    add_column :projects, :photocopy_copyright, :text
  end
end
