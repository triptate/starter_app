class PasswordResetsController < ApplicationController

  before_action :require_logged_out
  before_action :user, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by_email params[:email].downcase

    if user
      user.generate_reset_password_token!
      UserMailer.reset_password(user.id).deliver
      flash[:success] = "Password reset instructions have been sent to #{user.email}. Check your inbox shortly."
      redirect_to new_session_path
    else
      flash[:danger] = 'That email is not in our database. Did you type it correctly?'
      render :new
    end

  end

  def edit
    return protect_against_expired_token if user.blank?
  end

  def update
    return protect_against_expired_token if user.blank?
    return protect_against_empty_password if params[:user][:password].blank?

    if user.change_password! params[:user][:password]
      auto_login user
      redirect_to logged_in_path
    else
      flash[:danger] = 'Well, something went wrong with that...want to try again?'
      render :edit
    end
  end


  private

  def token
    @token ||= params[:id]
  end

  def user
    @user ||= User.load_from_reset_password_token token
  end

  def protect_against_expired_token
    flash.now[:danger] = 'Hmmm...that password token is no longer valid. Try resetting your password again?'
    render :new
  end

  def protect_against_empty_password
    flash.now[:danger] = "You can't leave the password field blank! You crazy!"
    render :edit
  end

end
