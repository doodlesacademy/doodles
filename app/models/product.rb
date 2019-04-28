class Product < ActiveRecord::Base
  has_and_belongs_to_many :payments, join_table: 'payments_products'

  scope :active, -> { where(archived: false) }

  def self.find_for_user(user)
    user.payments.map(&:products).flatten.uniq
  end

  def self.format_price(price)
    cents = price % 100
    cents = cents < 10 ? "0#{cents}" : cents.to_s
    dollars = price / 100
    "$#{dollars}.#{cents}"
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

  def allow_purchase?
    !beta
  end
end
