class RenameDescriptionToSynopsisOfLessons < ActiveRecord::Migration
  def change
    rename_column :lessons, :description, :synopsis
  end
end
