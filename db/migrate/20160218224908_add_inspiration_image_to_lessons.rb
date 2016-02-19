class AddInspirationImageToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :inspiration_image, :string
  end
end
