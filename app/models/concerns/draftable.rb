require 'active_support/concern'

module Draftable
  extend ActiveSupport::Concern

  included do
    enum status: [:draft, :publish, :archive]
    after_initialize :init_as_draft

    scope :draft -> { where(status: self.statuses[:draft]) }
    scope :published -> { where(status: self.statuses[:publish]) }
    scope :archived -> { where(status: self.statuses[:archive]) }
  end

  def init_as_draft 
    self.status = "draft"
  end
end
