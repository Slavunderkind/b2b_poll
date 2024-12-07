class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :poll

  validates :user_id, uniqueness: { scope: :poll_id, message: "has already voted for this poll" }
end
