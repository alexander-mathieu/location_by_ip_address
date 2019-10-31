class LocationByIpFacade
  def initialize(ipv4_address)
    @ipv4_address = ipv4_address
  end

  def location_info
    @location_info ||= accuweather_service.location_by_ip_address(ipv4_address)
  end

  private

  attr_reader :ipv4_address

  def accuweather_service
    AccuweatherService.new
  end
end