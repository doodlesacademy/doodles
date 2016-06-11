class AddWorktimeToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :worktime, :text
  end
end
