class EmailJob
  include Sidekiq::Job

  def perform(*args)
    UsersMailer.after_voting_email(args[0], args[1])
               .deliver_later(queue: 'mailers')
  end
end
