class Project < ActiveRecord::Base

  belongs_to :project_set

  has_many :lessons
  has_many :supply_items, -> { distinct }, through: :lessons

  enum level: [ :upper, :lower ]
  delegate :title, :inspiration_image, :synopsis, :gallery, 
    :skills, :books_media, :slug, to: :project_set
  alias_attribute :name, :title

end
