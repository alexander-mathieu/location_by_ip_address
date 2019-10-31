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

  describe 'with a no IP address' do
    it 'returns a 400 error' do
      get '/api/v1/locationByIp'

      error = JSON.parse(response.body, symbolize_names: true)[:error]

      expect(response.status).to eq(400)

      expect(error).to eq('Please provide an IP address as a query parameter.')
    end
  end

  describe 'with an invalid IP address' do
    it 'returns a 400 error' do
      ipv6_address = 'FE80:CD00:0000:0CDE:1257:0000:211E:729C'

      get '/api/v1/locationByIp', params: { ip: ipv6_address }

      error = JSON.parse(response.body, symbolize_names: true)[:error]

      expect(response.status).to eq(400)

      expect(error).to eq('Please provide an address with valid IPv4 formatting.')
    end
  end
end