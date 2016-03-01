class AddAttachmentBabyPictureToMembers < ActiveRecord::Migration
  def self.up
    change_table :members do |t|
      t.attachment :baby_picture
    end
  end

  def self.down
    remove_attachment :members, :baby_picture
  end
end
