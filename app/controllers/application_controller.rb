class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :setup_globals
  
private

  def setup_globals
    @app_name = "Oratio"
  end
  
end
