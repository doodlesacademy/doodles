class AddAttachmentInspirationImageToLessons < ActiveRecord::Migration
  def self.up
    change_table :lessons do |t|
      t.attachment :inspiration_image
    end
  end

  def self.down
    remove_attachment :lessons, :inspiration_image
  end
end
