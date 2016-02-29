class AddAttachmentDocumentToStandards < ActiveRecord::Migration
  def self.up
    change_table :standards do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :standards, :document
  end
end
