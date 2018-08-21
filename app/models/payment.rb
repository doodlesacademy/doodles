class Payment < ActiveRecord::Base
  has_and_belongs_to_many :products, join_table: 'payments_products'
end
