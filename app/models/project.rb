class Project < ActiveRecord::Base
  has_many :lessons
  validates :title, presence: true
end
