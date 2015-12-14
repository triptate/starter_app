class SessionsController < ApplicationController

  before_action :ensure_logged_out, only: :new
  before_action :ensure_logged_in, only: :destroy
  before_action :user, only: [:new, :create]

  def new
  end

  def create
    if login user_params[:email].downcase, user_params[:password]
      flash[:success] = "Nice, you're in..."
      redirect_to logged_in_path
    else
      flash[:danger] = 'Oops, you probably mistyped your email or password. Try again...'
      render :new
    end
  end

  def destroy
    logout
    session.clear
    redirect_to root_path
  end


  private

  def user
    @user ||= User.new
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
