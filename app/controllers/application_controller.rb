class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception


  private

  def ensure_logged_out
    redirect_to logged_in_path and return if current_user.present?
  end

  def ensure_logged_in
    redirect_to root_path and return if current_user.blank?
  end

  def logged_in_path
    user_path current_user
  end

end
