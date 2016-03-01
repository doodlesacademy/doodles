class AddAttachmentOverviewToLessons < ActiveRecord::Migration
  def self.up
    change_table :lessons do |t|
      t.attachment :overview
    end
  end

  def self.down
    remove_attachment :lessons, :overview
  end
end
