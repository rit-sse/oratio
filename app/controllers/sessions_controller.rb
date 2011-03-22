class SessionsController < ApplicationController
  def callback
    # Log the authorizing user in.
    self.current_user = auth["extra"][:uid].first
    
    redirect_to root_path, :notice => "You have signed in successfully."
  end
  
  def auth; request.env['omniauth.auth'] end
  
  def login_failure
    redirect_to "/auth/ldap", :notice => "Invalid credentials."
  end
  
  def sign_out
    sign_out!
  end
end