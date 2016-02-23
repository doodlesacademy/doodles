class RemoveColumnsFromProjectSets < ActiveRecord::Migration
  def change
    remove_column :project_sets, :synopsis, :string
    remove_column :project_sets, :books_media, :string
    remove_column :project_sets, :skills_description, :string
    remove_column :project_sets, :skills, :text
    remove_column :project_sets, :photocopies, :text
  end
end
