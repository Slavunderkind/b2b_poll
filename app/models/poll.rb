class Poll < ApplicationRecord
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true

  validates :title, presence: true

  def voted_by?(user_id)
    return false unless user_id

    (answers.flat_map(&:user_ids).uniq).include?(user_id)
  end

  def total_votes
    answers.sum(:votes)
  end
end
