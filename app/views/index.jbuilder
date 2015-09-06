json.cars @car_locations.each do |car_location|
	json.(car_location, :description)
	json.latitude car_location.coordinates[0]
	json.longitude car_location.coordinates[1]
end
