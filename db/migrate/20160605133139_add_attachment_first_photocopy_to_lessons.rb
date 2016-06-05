class AddAttachmentFirstPhotocopyToLessons < ActiveRecord::Migration
  def self.up
    change_table :lessons do |t|
      t.attachment :first_photocopy
    end
  end

  def self.down
    remove_attachment :lessons, :first_photocopy
  end
end
