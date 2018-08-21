class AddSampleImagesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :sample_images, :json
  end
end
