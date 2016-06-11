class AddAttachmentThirdPhotocopyToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :third_photocopy
    end
  end

  def self.down
    remove_attachment :projects, :third_photocopy
  end
end
