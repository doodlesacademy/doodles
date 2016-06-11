class AddMorePhotocopyColumnsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :first_photocopy_header, :text
    add_column :projects, :second_photocopy_header, :text
    add_column :projects, :third_photocopy_header, :text
  end
end
