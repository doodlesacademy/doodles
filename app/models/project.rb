class Project < ActiveRecord::Base

  belongs_to :project_set

  has_one :standard
  has_many :lessons
  has_many :supply_items, -> { distinct }, through: :lessons
  has_attached_file :inspiration_image, 
    styles: { large: "900x900>", medium: "300x300>", thumb: "100x100>" }, 
    default_url: "images/:style/missing.png"
  validates_attachment_content_type :inspiration_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  enum level: [ :upper, :lower ]
  delegate :title, :gallery, :slug, to: :project_set
  alias_attribute :name, :title

  after_create :generate_standard

  private
  def generate_standard
    self.standard = Standard.create(project: self)
  end

end
