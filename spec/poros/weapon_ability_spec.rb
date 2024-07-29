require 'rails_helper'

RSpec.describe WeaponAbility do
  it "can create weapon_ability from hash and have weapon_ability attributes", :vcr do
    json = WhService.get_units_by_faction(1)[:data].first[:weapons][:data].first[:abilities][:data].first
    weapon_ability = WeaponAbility.new(json)
    
    expect(weapon_ability).to be_a WeaponAbility
    expect(weapon_ability.id).to eq("6")
    expect(weapon_ability.name).to eq("Devastating Wounds")
    expect(weapon_ability.description).to eq("Critical wounds inflict mortal wounds instead")
  end
end