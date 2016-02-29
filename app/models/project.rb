class Project < ActiveRecord::Base
  include Sectionable

  enum level: [ :upper, :lower ]
  belongs_to :project_set
  has_one :standard, dependent: :destroy
  has_many :lessons, dependent: :destroy
  has_many :supply_items, -> { distinct }, through: :lessons
  delegate :title, :gallery, :slug, to: :project_set
  alias_attribute :name, :title
  after_create :generate_standard
  accepts_nested_attributes_for :standard

  has_sections %w(Synopsis Books/Media Skills Photocopies)
  has_attached_file :inspiration_image, 
    styles: { large: "900x900>", medium: "300x300>", thumb: "100x100>" }, 
    default_url: "images/:style/missing.png"
  validates_attachment_content_type :inspiration_image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  has_attached_file :overview, 
    styles: {thumbnail: "60x60#"}
  validates_attachment_content_type :overview, content_type: ["application/pdf"]

  def standards
    self.standard.section_contents
  end

  def academy
    "#{self.level} academy".titleize
  end

  private
  def generate_standard
    self.standard = Standard.create(project: self)
  end

end
