class Project < ActiveRecord::Base

  belongs_to :project_set

  has_many :lessons
  has_many :supply_items, -> { distinct }, through: :lessons

  enum level: [ :upper, :lower ]
  delegate :title, :gallery, :slug, to: :project_set
  alias_attribute :name, :title

end
