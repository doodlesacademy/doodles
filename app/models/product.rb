class Product < ActiveRecord::Base
  def formatted_price
    dollars = price / 100
    "$#{dollars}.00"
  end
end
