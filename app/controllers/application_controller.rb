class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :setup_globals
  
protected

  def current_user
    @current_user ||= AllowedUsers.find_by_id(session[:user_id])
  end

  def signed_in?
    !!current_user
  end

  helper_method :current_user, :signed_in?

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end
  
  def authorize!
    unless self.signed_in?
      session[:return_url] = request.uri
      redirect_to "/auth/ldap", :notice => "You must sign in to continue."
    end
  end
  
  def sign_out!
    session[:user_id] = nil
    session[:return_url] = nil
    redirect_to root_path, :notice => "You have signed out successfully."
  end

private

  def setup_globals
    @app_name = "Oratio"
  end
  
end
