class AddMoreColumnsToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :worktime_focus, :text
    add_column :lessons, :synopsis, :text
    add_column :lessons, :anticipated_problems, :text
    add_column :lessons, :early_finishers, :text
  end
end
