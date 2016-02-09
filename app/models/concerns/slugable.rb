require 'active_support/concern'

module Slugable
  extend ActiveSupport::Concern

  included do
    before_save :generate_slug
  end

  def generate_slug
    return unless self.title_changed?
    slug = self.title.downcase.gsub /[^a-z\s]+/, ''
    self.slug = slug.strip.gsub /\s/, '-'
  end
  
end
