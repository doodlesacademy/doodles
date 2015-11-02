class SupplyItem < ActiveRecord::Base
  has_and_belongs_to_many :lessons
  validates :name, presence: true

  def has_link?
    !url.blank?
  end
end
