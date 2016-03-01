class SupplyItem < ActiveRecord::Base
  has_and_belongs_to_many :lessons
  validates :name, presence: true

  def has_link?
    self.asin.present?
  end

  def url
    "http://www.amazon.com/dp/#{self.asin}/?tag=#{ENV['AMAZON_ASSOCIATE_ID']}"
  end

end
