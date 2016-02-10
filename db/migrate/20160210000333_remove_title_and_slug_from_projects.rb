class RemoveTitleAndSlugFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :title
    remove_column :projects, :slug
  end
end
