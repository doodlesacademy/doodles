class SupplyItem < ActiveRecord::Base
  has_many :supply_lists
  validates :name, presence: true
end
