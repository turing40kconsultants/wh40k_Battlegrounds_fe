require 'rails_helper'

RSpec.describe Unit do
  it "can create Unit from hash and have Unit attributes", :vcr do
    json = WhService.get_units_by_faction(1)[:data].first
    unit = Unit.new(json)

    expect(unit).to be_a Unit
    expect(unit.id).to eq("1")
    expect(unit.name).to eq("C'Tan Shard of the Nightbringer")
    expect(unit.toughness).to eq(11)
    expect(unit.wounds).to eq(12)
    expect(unit.sv).to eq(4)
    expect(unit.invul_sv).to eq(4)
    expect(unit.movement).to eq(6)
    expect(unit.objective_control).to eq(4)
    expect(unit.leadership).to eq(6)
  end
end