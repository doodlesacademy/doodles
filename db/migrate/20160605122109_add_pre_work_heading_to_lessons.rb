class AddPreWorkHeadingToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :pre_work_heading, :text
  end
end
