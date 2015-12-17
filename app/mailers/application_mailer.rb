class ApplicationMailer < ActionMailer::Base

  extend Brand
  include Resque::Mailer

  layout 'email'

  default from: 'The Pegu Labs Team <hi@pegulabs.com>'
  default reply_to: 'Pegu Labs Help <help@pegulabs.com>'

  helper_method :current_user

  def current_user
    @user ||= User.find_by_id @user_id
  end

  def recipient
    current_user.formatted_email
  end

end
