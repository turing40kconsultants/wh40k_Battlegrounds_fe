require "rails_helper"

RSpec.describe "Wh40k Battlegrounds facade", type: :facade do
  before(:each) do
    @base_url = 'https://wh40k-battlegrounds-be-ce09c759206c.herokuapp.com/'
  
    @units_from_faction = File.read('spec/fixtures/necron_units.json')
  end

  it 'can get all units from a faction', :vcr do
    faction_id = 1

    # stub_request(:get, "#{@base_url}/api/v1/factions/#{faction_id}/units").to_return(status: 200, body: @units_from_faction)
    
    facade = Wh40kBgsFacade.new
    response = facade.all_units(faction_id)

    expect(response).to be_an(Array)
    expect(response[0]).to be_a(Unit)
  end

  it 'can get one unit by id for a faction' do
    unit_id = 1

    stub_request(:get, "#{@base_url}/api/v1/units/#{unit_id}").to_return(status: 200, body: @units_from_faction)
    
    facade = Wh40kBgsFacade.new
    response = facade.one_unit(unit_id)

    expect(response).to be_a(Array)
  end

  it 'can get all factions', :vcr do
    response = Wh40kBgsFacade.new.all_factions

    expect(response).to be_an(Array)
    expect(response[0]).to be_an(Faction)
  end
end