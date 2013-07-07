class UserMailer < ActionMailer::Base
  default from: "admin@staance.com"

  def campaign_new_email(user, campaign)
  	@user = user
  	@campaign = campaign
  	mail(to: @user.email, subject: "Congratulations on Your New Staance Campaign")
  end


end
