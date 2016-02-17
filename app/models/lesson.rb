class Lesson < ActiveRecord::Base
  include Slugable
  has_and_belongs_to_many :supply_items
  belongs_to :project, counter_cache: true

  validates :title, presence: true
  validates :video_uri, presence: true
  alias_attribute :name, :title

  def video_id
    @video_uri.match(/\d+$/).to_s
  end

end
