module SpecialSlidesHelper
  require 'net/https'
  require 'uri'
  require 'xmlsimple'

  COMMON_FORMAT = '%A, %B %e %Y'

  def get_events(urls)
    urls = urls.split("\n") if urls.kind_of? String

    events = []

    urls.each do |url|
      resp = get_feed("https://www.google.com/calendar/feeds/#{url.strip}/public/full")

      data = XmlSimple.xml_in(resp.body)
      data['entry'].each do |item|
        item.sort.each do |k, v|
          if ["title", "comments", "when", "where", "who"].include? k
            if k == "title"
              events += [{ :title => v[0]['content'].to_s }]
            elsif k == "when"
              events.last[:start_time] = DateTime.parse(v[0]['startTime'].to_s)
              events.last[:end_time] = DateTime.parse(v[0]['endTime'].to_s)
            elsif k == "where"
              events.last[:where] = v[0]['valueString'].to_s
            end
          end
        end
      end
    end

    results = events.map do |event|
      if event[:start_time].nil? || !(event[:start_time] <= 10.days.from_now and event[:start_time] >= DateTime.now)
        nil
      else
        event
      end
    end

    results.compact.sort do |event1, event2|
      event1[:start_time] <=> event2[:start_time]
    end
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

  def format_dates(date1, date2)
    retval = ''
    if date1.strftime(COMMON_FORMAT) == date2.strftime(COMMON_FORMAT)
      retval << "#{date1.strftime(COMMON_FORMAT)}, "
      retval << "#{date1.strftime('%l:%M%P')} - #{date2.strftime('%l:%M%P')}"
    else
      retval << "#{date1.strftime(COMMON_FORMAT)}, #{date1.strftime('%l:%M%P')}"
      retval << ' - '
      retval << "#{date2.strftime(COMMON_FORMAT)}, #{date2.strftime('%l:%M%P')}"
    end
    retval
  end

end
