class AddSixthPhotocopyHeaderToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :sixth_photocopy_header, :text
  end
end
