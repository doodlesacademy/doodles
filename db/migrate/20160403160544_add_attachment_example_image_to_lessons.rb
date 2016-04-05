class AddAttachmentExampleImageToLessons < ActiveRecord::Migration
  def self.up
    change_table :lessons do |t|
      t.attachment :example_image
    end
  end

  def self.down
    remove_attachment :lessons, :example_image
  end
end
