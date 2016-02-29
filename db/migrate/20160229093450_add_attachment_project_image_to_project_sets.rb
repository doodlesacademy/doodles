class AddAttachmentProjectImageToProjectSets < ActiveRecord::Migration
  def self.up
    change_table :project_sets do |t|
      t.attachment :project_image
    end
  end

  def self.down
    remove_attachment :project_sets, :project_image
  end
end
