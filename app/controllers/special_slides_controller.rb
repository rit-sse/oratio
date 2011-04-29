class SpecialSlidesController < ApplicationController
  require 'net/https'
  require 'uri'
  require 'xmlsimple'

  # before_filter :check_google_login, :except => [:login, :do_login]

  def index
    resp = get_feed('https://www.google.com/calendar/feeds/ssemember@gmail.com/public/full')
    @resp = resp.body

    @events = []

    @tags = []
    data = XmlSimple.xml_in(resp.body)
    data['entry'].each do |item|
      item.sort.each do |k, v|
        # @tags += [k]
        if ["title", "comments", "when", "where", "who"].include? k
          if k == "title"
            @events += [{ :title => v[0]['content'].to_s }]
          elsif k == "when"
            @events.last[:start_time] = DateTime.parse(v[0]['startTime'].to_s).strftime '%A, %B %e %Y'
            @events.last[:end_time] = DateTime.parse(v[0]['endTime'].to_s).strftime '%A, %B %e %Y'
          elsif k == "where"
            @events.last[:where] = v[0]['valueString'].to_s
          end
        end
      end
    end
  end

protected

  class DateTime
    def common_format
      self.strftime '%A, %B %e %Y'
    end
  end

  def format_dates(*dates)
    retval = ''
    dates.each do |date|
      retval << date.common_format unless retval == date.common_format
      retval << ' - ' unless retval.empty?
    end
    retval
  end

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
