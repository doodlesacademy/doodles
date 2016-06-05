class AddAttachmentSecondPhotocopyToLessons < ActiveRecord::Migration
  def self.up
    change_table :lessons do |t|
      t.attachment :second_photocopy
    end
  end

  def self.down
    remove_attachment :lessons, :second_photocopy
  end
end
