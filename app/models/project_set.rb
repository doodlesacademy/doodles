class ProjectSet < ActiveRecord::Base
  include Slugable

  has_many :projects, dependent: :destroy
  has_one :gallery, dependent: :destroy

  validates :title, presence: true
  accepts_nested_attributes_for :projects
  after_create :generate_projects

  has_attached_file :project_image, 
    styles: { large: "900x900>", medium: "300x300>", thumb: "100x100>" }, 
    default_url: "images/:style/missing.png"
  validates_attachment_content_type :project_image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
  def upper
    get_project
  end

  def lower
    get_project(level: :lower)
  end

  def get_project(level: :lower)
    return unless [:upper, :lower].include? level
    self.projects.find_by(level: Project.levels[level])
  end

  private
  def generate_projects
    Project.create(project_set: self, level: "upper")
    Project.create(project_set: self, level: "lower")
  end

  
end
