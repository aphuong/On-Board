class InvitationsController < Devise::InvitationsController

  before_filter :update_sanitized_params, only: :update

  def new
    @user = User.new
    @users_confirmed = User.where('invitation_token IS NULL')
    @users = User.where('invitation_token IS NOT NULL')
  end

  def update
    respond_to do |format|
      format.js do
        invitation_token = Devise.token_generator.digest(resource_class, :invitation_token, update_resource_params[:invitation_token])
        self.resource = resource_class.where(invitation_token: invitation_token).first
        resource.skip_password = true
        resource.update_attributes update_resource_params.except(:invitation_token)
      end
        format.html do
          super
        end
      end
    end

  protected

  def update_sanitized_params
    devise_parameter_sanitizer.for(:accept_invitation) do |u|
      u.permit(:fname, :lname, :location, :goal, :fun_fact, :pre_wdi, :invitation_token, :password, :password_confirmation)
    end
  end

end
