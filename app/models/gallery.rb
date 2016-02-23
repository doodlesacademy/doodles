class Gallery < ActiveRecord::Base
  has_many :assets, as: :assetable
  has_many :images, through: :assets
  belongs_to :project_set
end
