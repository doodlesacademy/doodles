class AddFeaturedArtistDescriptionToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :featured_artist_description, :text
  end
end
