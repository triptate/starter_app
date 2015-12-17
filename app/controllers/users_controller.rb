class UsersController < ApplicationController

  before_action :require_logged_out, only: :new
  before_action :require_login, only: [:edit, :update, :destroy]
  before_action :user, except: [:new, :create]

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new user_params
    user.email.downcase!
    if user.save
      flash[:success] = 'Thanks for signing up!'
      auto_login user
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def update
    if user.update user_params
      flash[:success] = 'Nice work! All set.'
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Yikes! We couldn't update your info. Try again?"
      render :edit
    end
  end

  def destroy
    user.destroy
    flash[:success] = 'Sorry to see you go...'
    redirect_to root_path
  end


  private

  def user
    @user ||= User.friendly.find params[:id]
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
