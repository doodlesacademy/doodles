class AddEvenMorePhotocopyColumnsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :fourth_photocopy_header, :text
    add_column :projects, :fifth_photocopy_header, :text
  end
end
