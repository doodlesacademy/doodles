class AddPreWorkToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :pre_work, :text
  end
end
