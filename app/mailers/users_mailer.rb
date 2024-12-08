class UsersMailer < ApplicationMailer
  def after_voting_email(user_id, poll_id)
    @user = User.find(user_id)
    @poll = Poll.find(poll_id)

    mail(to: @user.email,
            subject: "Thank you for your vote!"
    ) do |format|
      format.text
      format.html
    end
  end
end
