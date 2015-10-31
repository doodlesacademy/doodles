class Lesson < ActiveRecord::Base
  belongs_to :project, counter_cache: true
  validates :title, presence: true
  validates :video_uri, presence: true
end
