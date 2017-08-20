class SubscriptionSet < ActiveRecord::Base
  belongs_to :subscription
  has_and_belongs_to_many :projects
end
