class LocationByIpSerializer
  def initialize(location_info)
    @location_info = location_info
  end

  def format_response
    {
      Country: {
        ID: location_info[:Key],
        LocalizedName: location_info[:Country][:LocalizedName]
      },
      latitude: location_info[:GeoPosition][:Latitude],
      longitude: location_info[:GeoPosition][:Longitude],
      IsDaylightSaving: location_info[:TimeZone][:IsDaylightSaving],
      processingCode: format_processing_code
    }
  end

  private

  attr_reader :location_info

  def format_processing_code
    "#{location_info[:Country][:LocalizedName]} - "\
    "#{location_info[:AdministrativeArea][:LocalizedName]} - "\
    "#{location_info[:LocalizedName]}"
  end
end
