class ProjectSet < ActiveRecord::Base
  belongs_to :lower, class_name: 'Project'
  belongs_to :upper, class_name: 'Project'
end
