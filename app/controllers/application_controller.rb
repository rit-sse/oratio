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
  
  def sign_in_path; "/auth/ldap"; end
  def sign_out_path; "/auth/sign_out"; end

  def settings_path; "/settings"; end
  def settings_index_path; "/settings"; end

  helper_method :current_user, :signed_in?, :sign_in_path, :sign_out_path, :settings_path

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end
  
  def authorize!
    unless signed_in?
      session[:return_url] = request.fullpath
      redirect_to sign_in_path, :notice => "You must sign in to continue."
    end
  end
  
  def sign_out!
    @current_user = nil
    session[:user_id] = nil
    redirect_to root_path, :notice => "You have signed out successfully."
  end

private

  def setup_globals
    @app_name = "Oratio"
  end
  
end
