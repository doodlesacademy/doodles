class ChangeGalleryToLesson < ActiveRecord::Migration
  def change
    rename_column :galleries, :project_set_id, :lesson_id
  end
end
