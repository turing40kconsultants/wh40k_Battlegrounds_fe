require 'rails_helper'

RSpec.describe Unit do
  it "can create Unit from hash and have Unit attributes" do
    json = WhService.get_units_by_faction(1)[:data].first
    unit = Unit.new(json)
binding.pry
    expect(unit).to be_a Unit
    # expect(unit.name).to eq("Necrons")
    # expect(unit.id).to eq("1")
  end
end