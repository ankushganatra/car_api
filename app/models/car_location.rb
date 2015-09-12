require 'mongo_mapper'
require_relative '../../config/environment'

class CarLocation
	include MongoMapper::Document
  set_collection_name "car_locations"

  key :vehicle_count,	Integer
  key :coordinates, Array
  key :location_id,	Integer
  key :restricted_p, String
  key :description, String
  key :market_id, Integer
  key :has_vans, Boolean
  key :zipfleet_id, Integer

  ensure_index [[:coordinates, '2d']]

  timestamps!

  PER_PAGE = 10

  def self.dump(file_path)
    uri = URI.parse(file_path)
    response = Net::HTTP.get_response(uri)
    data = JSON.parse(response.body)
    data["locations"].each do |child|
      CarLocation.create(vehicle_count: child["vehicle_count"],
                        restricted_p: child["restricted_p"],
                        description: child["description"],
                        market_id: child["market_id"],
                        coordinates: [child["latitude"].to_f, child["longitude"].to_f],
                        has_vans: child["has_vans"],
                        location_id: child["location_id"],
                        zipfleet_id: child["zipfleet_id"])
    end
  end

  def self.near(point, distance, offset)
    where(coordinates: {'$near' => point, '$maxDistance' => distance}).offset(offset*PER_PAGE).limit(PER_PAGE)
  end
  def self.get_all(offset)
    skip(offset * PER_PAGE).limit(PER_PAGE)
  end
end