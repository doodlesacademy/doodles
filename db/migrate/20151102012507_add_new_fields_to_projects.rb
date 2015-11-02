class AddNewFieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :level, :string, index: true
    add_column :projects, :skills_description, :text
    add_column :projects, :books_media, :text
  end
end
