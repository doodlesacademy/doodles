class AddPhotocopyUrlToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :first_photocopy_url, :text
    add_column :projects, :second_photocopy_url, :text
  end
end
