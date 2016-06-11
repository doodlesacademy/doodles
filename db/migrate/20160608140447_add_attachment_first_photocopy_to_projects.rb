class AddAttachmentFirstPhotocopyToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :first_photocopy
    end
  end

  def self.down
    remove_attachment :projects, :first_photocopy
  end
end
