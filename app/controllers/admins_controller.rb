class AdminsController < ApplicationController

  def home

  end

  def index
    @users = User.all
    @announcements = Announcement.all
    @announcement = Announcement.new
    @todos = Todo.all
    @todo = Todo.new
  end

end
