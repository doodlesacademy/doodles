class Asset < ActiveRecord::Base
  belongs_to :assetable
  enum type: [:image, :video, :file]
end
