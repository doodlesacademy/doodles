class Lesson < ActiveRecord::Base
  has_one :supply_list
  belongs_to :project, counter_cache: true
  validates :title, presence: true
  validates :video_uri, presence: true
end
