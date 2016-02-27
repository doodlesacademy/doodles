class AddAttachmentInspirationImageToProjects < ActiveRecord::Migration
  def self.up
    remove_column :projects, :inspiration_image
    change_table :projects do |t|
      t.attachment :inspiration_image
    end
  end

  def self.down
    remove_attachment :projects, :inspiration_image
  end
end
