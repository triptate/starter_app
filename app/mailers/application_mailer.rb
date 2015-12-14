class ApplicationMailer < ActionMailer::Base

  extend Brand
  include Resque::Mailer

  layout 'email'

  default from: 'Itinefairy Team <hi@itinefairy.com>'
  default reply_to: 'Itinefairy Help <help@alumnifire.com>'

  helper_method :current_user

  def current_user
    @user ||= User.find_by_id @user_id
  end

  def recipient
    current_user.formatted_email
  end

end
