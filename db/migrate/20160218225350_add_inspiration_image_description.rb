class AddInspirationImageDescription < ActiveRecord::Migration
  def change
    add_column :lessons, :inspiration_image_description, :text
  end
end
