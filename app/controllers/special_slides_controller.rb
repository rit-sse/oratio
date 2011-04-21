class SpecialSlidesController < ApplicationController
  require 'net/https'
  require 'uri'
  
  before_filter :check_google_login, :except => [:login, :do_login]

  def index
    resp = get_feed('https://www.google.com/calendar/feeds/default/private/full')
    @resp = resp.body
  end
  
  def login ; end
  def logout
    session[:google_login_auth] = nil
    redirect_to :action => :index
  end

  def do_login
    path = '/accounts/ClientLogin'

    data = "accountType=HOSTED_OR_GOOGLE&Email=#{params[:email]}" \
      "&Passwd=#{params[:password]}" \
      "&service=wise"

    req_headers = { "Content-Type" => "application/x-www-form-urlencoded" }
    resp, data = google_http.post(path, data, req_headers)

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
  def google_http
    return @google_http unless @google_http.nil?

    http = Net::HTTP.new('www.google.com', 443)
    http.use_ssl = true
    @google_http = http
  end

  def get_feed(uri)
    uri = URI.parse(uri)
    req_headers = { "Content-Type" => "application/x-www-form-urlencoded" }
    req_headers["Authorization"] = "GoogleLogin auth=#{session[:google_login_auth]}"
    
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    req = Net::HTTP::Get.new(uri.request_uri, req_headers)
    return http.request(req)
  end

  def check_google_login
    if session[:google_login_auth].nil?
      flash[:notice] = "Please log in to Google to continue."
      redirect_to :action => :login
    else
      @logged_in = true
    end
  end

end
