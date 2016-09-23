class AddAttachmentInstructorImageToProfiles < ActiveRecord::Migration
  def self.up
    change_table :profiles do |t|
      t.attachment :instructor_image
    end
  end

  def self.down
    remove_attachment :profiles, :instructor_image
  end
end
