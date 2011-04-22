class SpecialSlidesController < ApplicationController
  require 'net/https'
  require 'uri'
  require 'xmlsimple'
  
  # before_filter :check_google_login, :except => [:login, :do_login]

  def index
    resp = get_feed('https://www.google.com/calendar/feeds/ssemember@gmail.com/public/full')
    @resp = resp.body
    
    @stuff = []
    @tags = []
    data = XmlSimple.xml_in(resp.body)
    data['entry'].each do |item|
      item.sort.each do |k, v|
        @tags += [k]
        if ["title", "comments", "when", "where", "who"].include? k
          @stuff += ["<br />#{v[0]['content'].to_s}"] if k == "title"
          @stuff += [" => #{v[0]['startTime']} - #{v[0]['endTime']}"] if k == "when"
          @stuff += [" => #{v[0]['valueString']}"] if k == "where"
        end
      end
    end
  end
  
protected
  def get_feed(uri)
    uri = URI.parse(uri)
    req_headers = { "Content-Type" => "application/x-www-form-urlencoded" }
    # req_headers["Authorization"] = "GoogleLogin auth=#{session[:google_login_auth]}"
    
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    req = Net::HTTP::Get.new(uri.request_uri, req_headers)
    return http.request(req)
  end

end
