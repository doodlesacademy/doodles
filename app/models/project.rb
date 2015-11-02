class Project < ActiveRecord::Base
  has_many :lessons
  has_many :supply_items, through: :lessons

  validates :title, presence: true
  validates :level, inclusion: { in: %w(upper lower) }
end
