class Page < ActiveRecord::Base
  include Slugable
  enum status: [:active, :archive]
  default_scope { where(status: Page.statuses[:active]) }

  def destroy
    self.archive!
    self.save!
  end

end
