class Station < ApplicationRecord
	belongs_to :train
	has_many :restaurant
end
