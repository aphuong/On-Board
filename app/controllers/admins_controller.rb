class AdminsController < ApplicationController

  def home

  end

  def index
    @announcements = Announcement.all
    @announcement = Announcement.new
  end

end
