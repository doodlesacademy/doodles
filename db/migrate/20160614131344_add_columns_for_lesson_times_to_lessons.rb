class AddColumnsForLessonTimesToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :intro_time, :text
    add_column :lessons, :worktime_time, :text
  end
end
