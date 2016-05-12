class AddLessonDescriptionToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :lesson_description, :string
  end
end
