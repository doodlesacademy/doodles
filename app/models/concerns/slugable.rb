require 'active_support/concern'
require 'stringex'

module Slugable
  extend ActiveSupport::Concern

  included do
    after_initialize :generate_slug
    before_save :generate_slug
  end

  def generate_slug
    return unless self.title_changed?
    self.slug = self.title.to_url
  end
end
