class AddColumnsBackToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :synopsis, :text
    add_column :projects, :books_media, :text
    add_column :projects, :skills, :text
    add_column :projects, :inspiration_image, :text
    add_column :projects, :photocopies, :text
  end
end
