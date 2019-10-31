require 'rails_helper'

RSpec.describe 'locationByIp endpoint', type: :request do
  describe 'with a valid IP address' do
    it 'returns location information' do
      ipv4_address = '73.14.137.32'

      get '/api/v1/locationByIp', params: { ip: ipv4_address }

      location_by_ip = JSON.parse(response.body, symbolize_names: true)
      country = location_by_ip[:Country]

      expect(response.status).to eq(200)

      expect(location_by_ip[:latitude]).to be_within(0.1).of(27.1)
      expect(location_by_ip[:longitude]).to be_within(0.1).of(-82.4)
      expect(location_by_ip[:IsDaylightSaving]).to be(true || false)
      expect(location_by_ip[:processingCode]).to eq('United States - Florida - Venice')
    end
  end
end