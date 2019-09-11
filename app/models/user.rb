class User < ApplicationRecord
	has_many :favorite
	has_many :relationship
	belongs_to :tag
end
