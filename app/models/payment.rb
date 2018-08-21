class Payment < ActiveRecord::Base
  has_and_belongs_to_many :products, join_table: 'payments_products'
  belongs_to :user

  after_create :generate_confirmation_number

  def formatted_amount
    Product.format_price(amount)
  end

  private

  def generate_confirmation_number
    self.confirmation_number = SecureRandom.hex
    save
  end
end
