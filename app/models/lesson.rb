class Lesson < ActiveRecord::Base
  include Slugable
  has_and_belongs_to_many :supply_items
  has_many :instruction_groups
  belongs_to :project, counter_cache: true
  after_create :create_instruction_groups

  validates :title, presence: true
  validates :video_uri, presence: true
  alias_attribute :name, :title

  def video_id
    return unless @video_uri.present?
    @video_uri.match(/\d+$/).to_s
  end

  private

  def create_instruction_groups
    %w(Inspiration Introduction Worktime Clean-Up/Presentations).each do |title|
      self.instruction_groups.create(title: title)
    end
  end

end
