class Answer < ApplicationRecord
  belongs_to :poll

  validates :name, presence: true

  def vote
    increment!(:votes)
  end

  def percentage
    total_votes = poll.total_votes
    return 0 if total_votes == 0

    (votes.to_f / total_votes * 100).round(2)
  end
end
