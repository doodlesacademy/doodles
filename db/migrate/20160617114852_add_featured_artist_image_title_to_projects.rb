class AddFeaturedArtistImageTitleToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :featured_artist_image_title, :text
  end
end
