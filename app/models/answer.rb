class Answer < ApplicationRecord
  belongs_to :poll

  validates :name, presence: true

  serialize :user_ids, type: Array, coder: JSON

  def vote(user_id)
    add_user(user_id)
    increment!(:votes)

    mail = UsersMailer.after_voting_email(user_id, poll.id)
    # mail.deliver_later
    mail.deliver_now
  end


  def add_user(user_id)
    self.user_ids << user_id
    self.user_ids.uniq! # Ensure no duplicates
    save
  end

  def percentage
    total_votes = poll.total_votes
    return 0 if total_votes == 0

    (votes.to_f / total_votes * 100).round(2)
  end
end