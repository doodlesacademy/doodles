class Project < ActiveRecord::Base

  include Slugable

  has_many :lessons
  has_many :supply_items, through: :lessons

  validates :title, presence: true
  validates :level, inclusion: { in: %w(upper lower) }

end
