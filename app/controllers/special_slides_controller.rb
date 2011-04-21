class SpecialSlidesController < ApplicationController
  require 'net/http'
  
  before_filter :check_google_login

  def index
    @login_token = session[:google_login_auth]
  end

  def login
  end

  def logout
    session[:google_login_auth] = nil
    redirect_to :action => :index
  end

  def do_login
    http = Net::HTTP.new('www.google.com', 443)
    http.use_ssl = true
    path = '/accounts/ClientLogin'

    data = "accountType=HOSTED_OR_GOOGLE&Email=#{params[:email]}" \
      "&Passwd=#{params[:password]}" \
      "&service=wise"

    req_headers = { "Content-Type" => "application/x-www-form-urlencoded" }
    resp, data = http.post(path, data, req_headers)

    cl_string = data[/Auth=(.*)/, 1]
    if cl_string.nil?
      flash[:alert] = "Login failed. Please try again."
      render :login
    else
      flash[:notice] = "Login successful."
      session[:google_login_auth] = cl_string
      redirect_to :action => :index
    end
  end

protected

  def check_google_login
    if session[:google_login_auth].nil?
      flash[:notice] = "Please log in to Google to continue."
      redirect_to :action => :login
    else
      @logged_in = true
    end
  end

end
