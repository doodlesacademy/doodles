class Project < ActiveRecord::Base
  has_many :lessons
  has_many :supply_items, through: :lessons

  validates :title, presence: true
  validates :slug, presence: true
  validates :level, inclusion: { in: %w(upper lower) }
  before_save :generate_slug

  private
  def generate_slug
    slug = self.title.downcase.gsub /[^a-z\s]+/, ''
    self.slug = slug.strip.gsub /\s/, '-'
  end
end
