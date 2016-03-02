class AddAttachmentFeaturedArtistImageToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :featured_artist_image
    end
  end

  def self.down
    remove_attachment :projects, :featured_artist_image
  end
end
