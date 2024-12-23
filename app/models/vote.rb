class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :poll

  validates :user_id, uniqueness: { scope: :poll_id, message: "has already voted for this poll" }

  after_commit :enqueue_email_job, on: :create

  private

  def enqueue_email_job
    Rails.logger.info("User id is #{self.user_id} and poll id is #{self.poll_id}")

    EmailJob.perform_in(Rails.application.config.delay_job_time, self.user_id, self.poll_id)
  end
end
