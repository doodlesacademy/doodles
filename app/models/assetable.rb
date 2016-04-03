class Assetable < ActiveRecord::Base
  has_one :asset
  belongs_to :assetable, polymorphic: true

  accepts_nested_attributes_for :asset

end
