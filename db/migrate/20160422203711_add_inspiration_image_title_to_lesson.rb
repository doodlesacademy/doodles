class AddInspirationImageTitleToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :inspiration_image_title, :string
  end
end
