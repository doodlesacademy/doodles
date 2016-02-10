class Project < ActiveRecord::Base

  belongs_to :project_set

  has_many :lessons
  has_many :supply_items, through: :lessons

  enum level: [ :upper, :lower ]

  def title
    project_set.title
  end

end
