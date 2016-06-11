class AddAttachmentSecondPhotocopyToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :second_photocopy
    end
  end

  def self.down
    remove_attachment :projects, :second_photocopy
  end
end
