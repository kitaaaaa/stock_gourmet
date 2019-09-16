class Station < ApplicationRecord
	has_many :station_trains
	has_many :restaurants
end
