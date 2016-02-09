class AddSlugIndexToProjects < ActiveRecord::Migration
  def change
    add_index :projects, :slug
  end
end
