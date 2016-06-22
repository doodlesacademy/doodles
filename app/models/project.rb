class Project < ActiveRecord::Base
  include Sectionable

  enum level: [ :upper, :lower ]
  belongs_to :project_set
  has_many :lessons, dependent: :destroy
  has_many :supply_items, -> { distinct }, through: :lessons
  delegate :title, :gallery, :slug, to: :project_set
  alias_attribute :name, :title

  default_scope { order('updated_at desc') }

  has_sections 'At-A-Glance' => [:synopsis, :skills, :materials, 'Books/Media', :photocopies], standards: [:common_core, :national_core, :art_elements, :art_principles, :cross_curricular]

  has_attached_file :inspiration_image,
    styles: { large: "900x900>", medium: "300x300>", thumb: "100x100>" },
    default_url: "images/:style/missing.png"
  validates_attachment_content_type :inspiration_image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  has_attached_file :featured_artist_image,
    styles: { large: "900x900>", medium: "300x300>", thumb: "100x100>" },
    default_url: "images/:style/missing.png"
  validates_attachment_content_type :inspiration_image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  has_attached_file :overview,
    styles: {thumbnail: "60x60#"},
    default_url: ""
  validates_attachment_content_type :overview, content_type: ["application/pdf"]

  has_attached_file :first_photocopy,
    default_url: ""
  validates_attachment_content_type :first_photocopy, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf", 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' ,'applicationvnd.ms-word', 'text/plain']

  has_attached_file :second_photocopy,
    default_url: ""
  validates_attachment_content_type :second_photocopy, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf", 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' ,'applicationvnd.ms-word', 'text/plain']
  has_attached_file :third_photocopy,
    default_url: ""
  validates_attachment_content_type :third_photocopy, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf", 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' ,'applicationvnd.ms-word', 'text/plain']

  has_attached_file :fourth_photocopy,
    default_url: ""
  validates_attachment_content_type :fourth_photocopy, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf", 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' ,'applicationvnd.ms-word', 'text/plain']

  has_attached_file :fifth_photocopy,
    default_url: ""
  validates_attachment_content_type :fifth_photocopy, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf", 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' ,'applicationvnd.ms-word', 'text/plain']

  def standards
    self.standard.section_contents
  end

  def academy
    "#{self.level} academy".titleize
  end

  def url
    url = project_url(self.slug)
    url.gsub /http\:\/\//, "http://#{self.level}"
  end

  def next_project
    return unless self.project_set.unit_number < ProjectSet.count
    project_set = ProjectSet.find_by(unit_number: self.project_set.unit_number + 1)
    return unless project_set.present?
    project_set.get_project(level: self.level)
  end

end
