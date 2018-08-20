class Product < ActiveRecord::Base
  def self.format_price(price)
    dollars = price / 100
    "$#{dollars}.00"
  end

  def formatted_price
    self.class.format_price(price)
  end
end
