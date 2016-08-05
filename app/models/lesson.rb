class Lesson < ActiveRecord::Base
  include Slugable
  include Sectionable
  include Draftable

  default_scope { order(:order) }

  has_and_belongs_to_many :supply_items
  has_one :gallery
  belongs_to :project, counter_cache: true

  validates :title, presence: true
  delegate :level, to: :project
  alias_attribute :name, :title
  after_initialize :set_order

  has_sections overview: [:synopsis, :objective, :setup, :media, :photocopies, ], instructions: [:inspiration, :introduction, 'Independent Worktime', 'Clean Up/Presentations'], issues: [:anticipated_problems, :early_finishers]

  has_attached_file :example_image,
    styles: { large: "900x900>", medium: "300x300>", thumb: "100x100>" },
    default_url: "images/:style/missing.png"
  validates_attachment_content_type :example_image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  has_attached_file :inspiration_image,
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

  def video_id
    return unless @video_uri.present?
    @video_uri.match(/\d+$/).to_s
  end

  def synopsis_old
    content = self.sections.first().content
    content = content[0, content.enum_for(:scan, /^## Objective/).map { Regexp.last_match.begin(0) }[0]]
    content = content.gsub(/#+ .*\n/, '')
    return content
  end

  def first_lesson
    self.project.lessons.published.find_by(order: 0)
  end

  def next_lesson
    return unless self.lesson_number < self.project.lessons.published.count
    self.project.lessons.published.find_by(order: self.order + 1)
  end

  # Change from zero index to one index
  def lesson_number
    self.order + 1
  end

  def has_new_format?
    self.objective.present?
  end

  private

  def set_order
    self.order ||= self.project.lessons.count
  end

end
