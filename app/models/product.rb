class Product < ActiveRecord::Base
  has_and_belongs_to_many :payments, join_table: 'payments_products'

  scope :active, -> { where(archived: false) }

  def self.find_for_user(user)
    user.payments.map(&:products).flatten.uniq
  end

  def self.format_price(price)
    dollars = price / 100
    "$#{dollars}.00"
  end

  def formatted_price
    self.class.format_price(price)
  end

  def formatted_full_price
    return nil if full_price.nil?
    self.class.format_price(full_price)
  end

  def full_title
    subtitle.nil? ? name : "#{name}: #{subtitle}"
  end
end
