class Api::V1::LocationByIpController < ApplicationController
  before_action :validate_ipv4_address, only: :index

  def index
    facade = LocationByIpFacade.new(params[:ip])
    location_serializer = LocationByIpSerializer.new(facade.location_info)
    render json: location_serializer.format_response
  end

  private

  def validate_ipv4_address
    if !params[:ip].match?(/\b(?:\d{1,3}\.){3}\d{1,3}\b/)
      render json: { error: 'Please provide an address with valid IPv4 formatting.' }, status: 400
    end
  end
end