class Profile < ActiveRecord::Base
  belongs_to :user
  has_attached_file :avatar,
    styles: { large: "900x900#", medium: "300x300#", small: "200x200#", thumb: "100x100#" },
    default_url: "images/person-icon.png"
  validates_attachment_content_type :avatar, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def profile
    super || build_profile
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def city_state
    "#{self.city}, #{self.state}"
  end

  def greeting
    if Time.now.hour < 12
      time_greeting = 'good morning'
    elsif Time.now.hour < 6
      time_greeting = 'good afternoon'
    else
      time_greeting = 'good evening'
    end
    greetings = %w(hello welcome greetings)
    greetings.push(time_greeting)
    greetings.sample
  end

  def classroom_fields
    %w(school city state country occupation grades)
  end

end
