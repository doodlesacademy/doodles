class Product < ActiveRecord::Base
  has_and_belongs_to_many :payments, join_table: 'payments_products'

  def self.format_price(price)
    dollars = price / 100
    "$#{dollars}.00"
  end

  def formatted_price
    self.class.format_price(price)
  end
end
