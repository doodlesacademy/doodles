class Section < ActiveRecord::Base
  enum status: [:active, :archived]

  belongs_to :sectionable, polymorphic: true

  default_scope { where(status: Section.statuses[:active]).order(:order) }

  alias_attribute :name, :title
  alias_attribute :section, :content

  after_initialize :init_as_active

  def slug
    slug = self.title.downcase.gsub /[^a-z\s]+/, ''
    slug = slug.strip.gsub /\s+/, '-'
  end

  def to_markdown
    helper.markdown self.section
  end

  private
  def init_as_active
    self.status ||= :active
  end
end
