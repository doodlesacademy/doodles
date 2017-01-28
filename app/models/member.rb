class Member < ActiveRecord::Base
  enum role: [ :board, :volunteer, :intern, :resource_council ]

  has_attached_file :avatar, 
    styles: { large: "900x900>", medium: "300x300>", small: "200x200>", thumb: "100x100>" }, 
    default_url: "images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  has_attached_file :baby_picture, 
    styles: { large: "900x900>", medium: "300x300>", thumb: "100x100>" }, 
    default_url: "images/:style/missing.png"
  validates_attachment_content_type :baby_picture, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def name
    "#{first_name} #{last_name}"
  end

  def modal_photo
    return self.baby_picture.url(:medium) if self.baby_picture.exists?
    self.avatar.url(:small)
  end
end
