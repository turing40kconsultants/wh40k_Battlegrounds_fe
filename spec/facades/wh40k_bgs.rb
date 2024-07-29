require "rails_helper"

RSpec.describe "Wh40k Battlegrounds facade", type: :facade do
  before(:each) do
    @base_url = 'https://wh40k-battlegrounds-be-ce09c759206c.herokuapp.com/'
  
    @units_from_faction = File.read('spec/fixtures/necron_units')
  end

  it 'can get all units from a faction' do
    faction_id = 1

    stub_request(:get, "#{@base_url}/api/v1/factions/#{faction_id}/units").to_return(status: 200, body: @units_from_faction)
    
    facade = Wh40kBgsFacade.new
    response = facade.all_units(faction_id)

    expect(response).to be_an(Array)
    expect(response[0]).to have_content("weapons")

  end

  it 'can get one unit by id for a faction' do
    faction_id = 1
    unit_id = 1

    stub_request(:get, "#{@base_url}/api/v1/factions/#{faction_id}/units").to_return(status: 200, body: @units_from_faction)
    
    facade = Wh40kBgsFacade.new
    response = facade.one_unit(faction_id, unit_id)

    expect(response).to be_a(Hash)
  end
end