class UsersController < ApplicationController

  def home
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to edit_user_path(@user), notice: 'User profile successfully updated.'
    else
      render :show, alert: 'Sorry - something went wrong.'
    end
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update_with_password(user_params)
      sign_in @user, :bypass => true
      redirect_to edit_user_path(@user), notice: 'User account successfully updated.'
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :current_password, :email, :fname, :lname, :location, :github_username, :twitter_username, :tumblr_username, :linkedin_username, :goal, :fun_fact, :pre_wdi)
  end

end


