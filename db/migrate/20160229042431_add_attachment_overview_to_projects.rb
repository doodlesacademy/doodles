class AddAttachmentOverviewToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :overview
    end
  end

  def self.down
    remove_attachment :projects, :overview
  end
end
