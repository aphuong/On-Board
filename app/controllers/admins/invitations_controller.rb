class Admins::InvitationsController < Devise::InvitationsController

  def invite_user
    @user = User.invite!(:email => params[:user][:email])
  end

  def accept_invitation!
    @user = User.accept_invitation!(:invitation_token => params[:invitation_token])
  end

end
