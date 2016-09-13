class Profile < ActiveRecord::Base
  belongs_to :user

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def salutation
    self.gender.downcase == "m" ? "Mr." : "Mrs."
  end

end
