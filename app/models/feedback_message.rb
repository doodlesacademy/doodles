class FeedbackMessage < ActiveRecord::Base
  validates :body, presence: true
  validates :sender, presence: true
end
