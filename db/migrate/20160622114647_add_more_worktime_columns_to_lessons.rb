class AddMoreWorktimeColumnsToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :additional_independent_worktime, :text
    add_column :lessons, :additional_group_worktime, :text
    add_column :lessons, :additional_worktime_time, :text
    add_column :lessons, :additional_worktime_focus, :text
  end
end
