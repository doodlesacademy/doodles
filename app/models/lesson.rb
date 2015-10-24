class Lesson < ActiveRecord::Base
  belongs_to :project, counter_cache: true
end
