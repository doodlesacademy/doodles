class AddAttachmentThirdPhotocopyToLessons < ActiveRecord::Migration
  def self.up
    change_table :lessons do |t|
      t.attachment :third_photocopy
    end
  end

  def self.down
    remove_attachment :lessons, :third_photocopy
  end
end
