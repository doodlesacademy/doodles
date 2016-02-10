class ProjectSet < ActiveRecord::Base
  include Slugable
  belongs_to :lower, class_name: 'Project'
  belongs_to :upper, class_name: 'Project'
  validates :title, presence: true
  has_many :projects

  after_create :generate_projects

  def upper
    self.projects.upper
  end

  def lower
    self.projects.lower
  end

  private
  def generate_projects
    Project.create(project_set: self, level: "upper")
    Project.create(project_set: self, level: "lower")
  end
end
