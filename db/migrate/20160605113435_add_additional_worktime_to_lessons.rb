class AddAdditionalWorktimeToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :additional_worktime, :text
  end
end
