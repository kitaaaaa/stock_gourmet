class Restaurant < ApplicationRecord
	belongs_to :menu
	belongs_to :genre
	belongs_to :station
	belongs_to :tag

	has_many :favorite
end
