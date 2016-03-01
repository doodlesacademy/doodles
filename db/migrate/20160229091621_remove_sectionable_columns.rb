class RemoveSectionableColumns < ActiveRecord::Migration
  def change
    remove_column :projects, :synopsis
    remove_column :projects, :books_media
    remove_column :projects, :skills
    remove_column :projects, :photocopies
  end
end
