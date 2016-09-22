class Profile < ActiveRecord::Base
  belongs_to :user

  def profile
    super || build_profile
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
