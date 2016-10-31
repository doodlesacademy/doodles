class AddLastViewedLessonToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_lesson_id, :integer
  end
end
