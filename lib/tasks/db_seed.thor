require_relative "../../app/models/car_location"

class DbSeed < Thor
	desc "dump_json['json_file_path']", "Inserts JSON into db"
	def dump_json(json_file_path)
		CarLocation.dump(json_file_path)
	end 
end