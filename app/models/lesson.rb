class Lesson < ActiveRecord::Base
  has_and_belongs_to_many :supply_items
  belongs_to :project, counter_cache: true

  validates :title, presence: true
  validates :video_uri, presence: true
end
