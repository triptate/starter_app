class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  def ensure_logged_out
    if current_user.present?
      redirect_to logged_in_path and return
    end
  end

  def logged_in_path
    user_path current_user
  end

end
