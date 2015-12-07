class FeedbackMessage < ActiveRecord::Base
  belongs_to :lesson

  validates :body, presence: true
  validates :sender, presence: true
end
