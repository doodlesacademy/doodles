class AddAttachmentFifthPhotocopyToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :fifth_photocopy
    end
  end

  def self.down
    remove_attachment :projects, :fifth_photocopy
  end
end
