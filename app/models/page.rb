class Page < ActiveRecord::Base
  include Slugable
  include Draftable
  enum status: [:active, :draft, :publish, :archive]
  default_scope { where(status: Page.statuses[:active]) }
  
  has_attached_file :inspiration_image, 
    styles: { large: "900x900>", medium: "300x300>", thumb: "100x100>" }, 
    default_url: "images/:style/missing.png"
  validates_attachment_content_type :inspiration_image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]


  def destroy
    self.archive!
    self.save!
  end

end
