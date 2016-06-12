class AddColumnsForWorkTimeToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :independent_worktime, :text
    add_column :lessons, :group_worktime, :text
  end
end
