class Api::V1::LocationByIpController < ApplicationController
  def index
    facade = LocationByIpFacade.new(params[:ip])
    location_serializer = LocationByIpSerializer.new(facade.location_info)
    render json: location_serializer.format_response
  end
end