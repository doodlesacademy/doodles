class Page < ActiveRecord::Base
  include Slugable
  include Draftable
  default_scope { where(status: Page.statuses[:published]) }
  
  has_attached_file :hero_image, 
    styles: { large: "900x900>", medium: "300x300>", thumb: "100x100>" }, 
    default_url: "images/:style/missing.png"
  validates_attachment_content_type :hero_image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def destroy
    self.archive!
    self.save!
  end

end
