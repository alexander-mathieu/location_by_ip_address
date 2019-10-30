require 'rails_helper'

RSpec.describe 'AccuweatherService' do
  describe 'instance methods' do
    it '.location_by_ip_address' do
      accuweather_service = AccuweatherService.new
      ipv4_address = '73.14.137.32'

      location = accuweather_service.location_by_ip_address(ipv4_address)

      expect(location).to have_key(:Country)
      expect(location).to have_key(:AdministrativeArea)
      expect(location).to have_key(:TimeZone)
      expect(location).to have_key(:GeoPosition)
    end
  end
end