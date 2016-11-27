class AddAttachmentSixthPhotocopyToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :sixth_photocopy
    end
  end

  def self.down
    remove_attachment :projects, :sixth_photocopy
  end
end