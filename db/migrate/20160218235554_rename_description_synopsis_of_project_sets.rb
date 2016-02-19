class RenameDescriptionSynopsisOfProjectSets < ActiveRecord::Migration
  def change
    rename_column :project_sets, :description, :synopsis
  end
end
