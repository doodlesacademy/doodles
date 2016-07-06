class AddVideoNoteToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :video_note, :text
  end
end
