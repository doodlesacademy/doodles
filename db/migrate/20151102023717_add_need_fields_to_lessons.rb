class AddNeedFieldsToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :objective, :text
    add_column :lessons, :set_up, :text
  end
end
