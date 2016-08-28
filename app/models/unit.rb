class Unit < ActiveRecord::Base
  has_many :project_sets

  def full_title
    "Unit #{order}: #{title}"
  end
end
