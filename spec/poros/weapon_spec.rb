require 'rails_helper'

RSpec.describe Weapon do
  it "can create weapon from hash and have weapon attributes", :vcr do
    json = WhService.get_units_by_faction(1)[:data].first[:weapons][:data].first
    weapon = Weapon.new(json)
    
    expect(weapon).to be_a Weapon
    expect(weapon.id).to eq("1")
    expect(weapon.name).to eq("Scythe of the Nightbringer - strike")
    expect(weapon.attacks).to eq(6)
    expect(weapon.ws).to eq(2)
    expect(weapon.strength).to eq(14)
    expect(weapon.ap).to eq(4)
    expect(weapon.damage).to eq("D6+2")
    expect(weapon.range).to eq(nil)
    expect(weapon.abilities).to be_a Array
  end
end