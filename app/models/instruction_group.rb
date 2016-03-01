class InstructionGroup < ActiveRecord::Base
  belongs_to :lesson
  has_many :instructions, dependent: :destroy

  default_scope { order(:order) }

  accepts_nested_attributes_for :instructions

  def slug
    slug = self.title.downcase.gsub /[^a-z\s]+/, ''
    slug = slug.strip.gsub /\s+/, '-'
  end
end
