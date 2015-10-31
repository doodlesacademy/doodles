class AddVideoUriToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :video_uri, :string
  end
end
