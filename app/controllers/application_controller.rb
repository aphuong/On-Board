class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def authenticate_inviter!
    authenticate_admin!(:force => true)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |user|
      user.permit(:password, :password_confirmation, :current_password, :email)
    }
  end

  def twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
    end
  end

end


