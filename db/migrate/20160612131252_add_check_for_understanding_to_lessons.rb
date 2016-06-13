class AddCheckForUnderstandingToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :check_for_understanding, :text
  end
end
