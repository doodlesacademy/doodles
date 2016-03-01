class AddAttachmentHeroImageToPages < ActiveRecord::Migration
  def self.up
    change_table :pages do |t|
      t.attachment :hero_image
    end
  end

  def self.down
    remove_attachment :pages, :hero_image
  end
end
