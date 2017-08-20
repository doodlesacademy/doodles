class SubscriptionSetProject < ActiveRecord::Base
  belongs_to :subscription_set
  belongs_to :project
end
