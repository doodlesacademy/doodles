class AddFeaturedArtistNameToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :featured_artist_name, :text
  end
end
