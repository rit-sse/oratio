class SessionsController < ApplicationController
  def callback
    username = auth["extra"][:uid].first
    user = AllowedUsers.find_by_username username
    
    unless user.nil?
      # Log the authorizing user in.
      self.current_user = user
      
      loc = session[:return_url] || root_path
      session[:return_url] = nil
      
      redirect_to loc, :notice => "You have signed in successfully."
    else
      redirect_to root_path, :notice => "You're ugly, and we don't want you here."
    end
  end
  
  def auth; request.env['omniauth.auth'] end
  
  def login_failure
    redirect_to "/auth/ldap", :notice => "Invalid credentials."
  end
  
  def sign_out
    sign_out!
  end
end