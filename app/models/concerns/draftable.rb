require 'active_support/concern'

module Draftable
  extend ActiveSupport::Concern

  included do
    enum status: [:draft, :publish, :archive]
    after_initialize :init_as_draft

    scope :draft, -> { where(status: self.statuses[:draft]) }
    scope :published, -> { where(status: self.statuses[:publish]) }
    scope :archived, -> { where(status: self.statuses[:archive]) }
  end

  def init_as_draft 
    self.status ||= "draft"
  end

  def status=(new_val)
    return self.status = self.class.statuses.key(new_val) if new_val.is_a? Integer
    super(new_val)
  end

end

