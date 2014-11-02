class UsersController < ApplicationController
  
  def home
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end


end
