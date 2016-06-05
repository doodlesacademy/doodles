class AddCleanUpToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :clean_up, :text
  end
end
