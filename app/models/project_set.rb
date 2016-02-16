class ProjectSet < ActiveRecord::Base
  include Slugable
  validates :title, presence: true
  has_many :projects

  after_create :generate_projects

  def upper
    get_project
  end

  def lower
    get_project(level: :lower)
  end

  private
  def generate_projects
    Project.create(project_set: self, level: "upper")
    Project.create(project_set: self, level: "lower")
  end

  def get_project(level: :upper)
    return unless [:upper, :lower].include? level
    self.projects.find_by(level: Project.levels[level])
  end
end
