class AddPhotocopiesToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :photocopies, :text
  end
end
