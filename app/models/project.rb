class Project < ActiveRecord::Base
  include Sectionable

  enum level: [ :upper, :lower ]
  belongs_to :project_set
  has_many :lessons, dependent: :destroy
  has_many :supply_items, -> { distinct }, through: :lessons
  delegate :title, :gallery, :slug, to: :project_set
  alias_attribute :name, :title

  default_scope { order('updated_at desc') }

  has_sections project_overview: [:synopsis, :skills], 'Set-up At A Glance' => [:materials, 'Books/Media', :photocopies], standards: [:common_core, :national_core, :art_elements, :art_principes, :cross_curricular]
  
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

end
