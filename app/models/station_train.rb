class StationTrain < ApplicationRecord
  belongs_to :station
  belongs_to :train
end
