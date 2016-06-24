require 'active_support/concern'

module Draftable
  extend ActiveSupport::Concern

  included do
    enum status: [:draft, :published, :archived]

    scope :draft, -> { where(status: self.statuses[:draft]) }
    scope :published, -> { where(status: self.statuses[:published]) }
    scope :archived, -> { where(status: self.statuses[:archived]) }
  end

  def status=(new_val)
    return self.status = self.class.statuses.key(new_val) if new_val.is_a? Integer
    super(new_val)
  end

end

