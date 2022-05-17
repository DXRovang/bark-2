class OwnerNotificationMailer < ApplicationMailer
  default from: 'donotreply@email.com'

  def owner_notification_email
    @user = params[:user]
    # @review = params[:review]
    mail(to: @user.email, subject: "You have a new review!")
  end

end
