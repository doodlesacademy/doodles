class AddMediaToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :media, :text
  end
end
