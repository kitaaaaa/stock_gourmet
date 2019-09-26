require 'rails_helper'

RSpec.describe Station, type: :model do
  it "is valid with station string" do
    station = Station.new(station: "some station")
    expect(station).to be_valid
  end
end
