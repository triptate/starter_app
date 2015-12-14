class UserMailer < ApplicationMailer

  def reset_password user_id
    # sorcery sends a user object to this method
    # resque converts param objects to hashes
    # we need to extract the user from the object even when converted
    @user_id = user_id
    @url  = edit_password_reset_url current_user.reset_password_token

    subject = "Reset your #{Brand.name} password"
    mail to: recipient, subject: subject
  end

end
