class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception


  private

  def require_logged_out
    redirect_to logged_in_path and return if logged_in?
  end

  def logged_in_path
    user_path current_user
  end

end
