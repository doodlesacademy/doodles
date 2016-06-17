class AddAttachmentFourthPhotocopyToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :fourth_photocopy
    end
  end

  def self.down
    remove_attachment :projects, :fourth_photocopy
  end
end
