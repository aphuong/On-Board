class AnnouncementsController < ApplicationController

  before_action :set_announcement, only: [:edit, :update, :destroy]

  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_params)
    if @announcement.save
      flash[:notice] = "Your announcement has been successfully broadcast."
      redirect_to admins_dashboard_path
    else
      flash[:alert] = "We encountered a problem. Please try again."
      render "admins#index"
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @announcement.update(announcement_params)
        format.html { redirect_to edit_announcement_path(@announcement), :notice => "Announcement was successfully updated." }
        format.json { respond_with_bip(@announcement) }
      else
        render "admins/dashboard", alert: "Sorry - something went wrong."
      end
    end
  end

  def destroy
    @announcement.destroy
    redirect_to admins_dashboard_path
  end

  private

    def announcement_params
      params.require(:announcement).permit(:body)
    end

    def set_announcement
      @announcement = Announcement.find(params[:id])
    end
end
