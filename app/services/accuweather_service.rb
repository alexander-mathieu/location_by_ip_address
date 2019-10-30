class AccuweatherService
  def location_by_ip_address(ipv4_address)
    parse_response('locations/v1/cities/ipaddress', q: ipv4_address)
  end

  private

  def parse_response(url, params = {})
    response = connection.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def connection
    Faraday.new('http://dataservice.accuweather.com') do |f|
      f.params['apikey'] = ENV['ACCUWEATHER_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end
end