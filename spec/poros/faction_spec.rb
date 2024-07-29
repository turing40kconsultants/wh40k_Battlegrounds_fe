require 'rails_helper'

RSpec.describe Faction do
  it "can create Faction from hash and have Faction attributes" do
    json = WhService.get_factions[:data].first
    faction = Faction.new(json)

    expect(faction).to be_a Faction
    expect(faction.name).to eq("Necrons")
    expect(faction.id).to eq("1")
  end
end