class Assetable < ActiveRecord::Base
  has_one :asset
  belongs_to :assetable, polymorphic: true
end
