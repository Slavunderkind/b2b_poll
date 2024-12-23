class Poll < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :user

  accepts_nested_attributes_for :answers, allow_destroy: true

  validates :title, presence: true

  def vote(user_id, answer)
    answer.vote
    Vote.create!(user_id: user_id, poll_id: id)
  end

  def voted_by?(user)
    return false unless user

    votes.exists?(user: user)
  end

  def total_votes
    votes.count
  end
end
