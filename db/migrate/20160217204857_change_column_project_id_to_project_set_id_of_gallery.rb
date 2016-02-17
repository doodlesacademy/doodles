class ChangeColumnProjectIdToProjectSetIdOfGallery < ActiveRecord::Migration
  def change
    rename_column :galleries, :project_id, :project_set_id
  end
end
