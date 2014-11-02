class UsersController < ApplicationController
  # before_action :authenticate_user!
  
  def home
  end

  def index
    @users = User.all
  end


end
