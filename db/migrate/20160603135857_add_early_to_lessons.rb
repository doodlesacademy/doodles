class AddEarlyToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :early_finishers, :text
  end
end
