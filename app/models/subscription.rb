class Subscription < ActiveRecord::Base
  belongs_to :user
  has_many :subscription_sets
end
