class Gallery < ActiveRecord::Base
  has_many :assets, class_name: "Assetable", as: :assetable
  has_many :images, through: :assets
  belongs_to :lesson

  accepts_nested_attributes_for :assets
end
