require 'rails_helper'

describe WhService do
  it "returns factions data" do
    response = WhService.get_factions

    expect(response).to be_a Hash
    expect(response[:data]).to be_a Array

    faction_data = response[:data].first

    expect(faction_data[:attributes]).to have_key :name
    expect(faction_data[:attributes][:name]).to be_a(String)

    expect(faction_data).to have_key :type
    expect(faction_data[:type]).to be_a(String)

    expect(faction_data).to have_key :id

    expect(faction_data[:id].to_i).to be_a(Integer)
  end

  it "returns units data" do
    response = WhService.get_units_by_faction(1)

    expect(response).to be_a Hash
    expect(response[:data]).to be_a Array

    unit = response[:data].first

    expect(unit).to have_key(:id)
    expect(unit[:id]).to be_a(String)

    expect(unit[:attributes]).to have_key(:name)
    expect(unit[:attributes][:name]).to be_a(String)

    expect(unit[:attributes]).to have_key(:movement)
    expect(unit[:attributes][:movement]).to be_a(Integer)

    expect(unit[:attributes]).to have_key(:toughness)
    expect(unit[:attributes][:toughness]).to be_a(Integer)

    expect(unit[:attributes]).to have_key(:sv)
    expect(unit[:attributes][:sv]).to be_a(Integer)

    expect(unit[:attributes]).to have_key(:invul_sv)
    if unit[:attributes][:invul_sv].nil?
      expect(unit[:attributes][:invul_sv]).to be_nil
    else
      expect(unit[:attributes][:invul_sv]).to be_a(Integer)
    end

    expect(unit[:attributes]).to have_key(:wounds)
    expect(unit[:attributes][:wounds]).to be_a(Integer)

    expect(unit[:attributes]).to have_key(:leadership)
    expect(unit[:attributes][:leadership]).to be_a(Integer)

    expect(unit[:attributes]).to have_key(:objective_control)
    expect(unit[:attributes][:objective_control]).to be_a(Integer)

    unit[:weapons][:data].each do |weapon|
      expect(weapon).to have_key(:id)
      expect(weapon[:id]).to be_a(String)
  
      expect(weapon[:attributes]).to have_key(:name)
      expect(weapon[:attributes][:name]).to be_a(String)
  
      expect(weapon[:attributes]).to have_key(:attacks)
      expect(weapon[:attributes][:attacks]).to be_a(String)
  
      expect(weapon[:attributes]).to have_key(:ws)
      expect(weapon[:attributes][:ws]).to be_a(Integer)
  
      expect(weapon[:attributes]).to have_key(:strength)
      expect(weapon[:attributes][:strength]).to be_a(Integer)

      expect(weapon[:attributes]).to have_key(:ap)
      expect(weapon[:attributes][:ap]).to be_a(Integer)

      expect(weapon[:attributes]).to have_key(:damage)
      expect(weapon[:attributes][:damage]).to be_a(String)

      expect(weapon[:attributes]).to have_key(:range)
      if weapon[:attributes][:range].nil?
        expect(weapon[:attributes][:range]).to be_nil
      else
        expect(weapon[:attributes][:range]).to be_a(Integer)
      end

      weapon[:abilities][:data].each do |ability|
        expect(ability).to have_key(:id)
        expect(ability[:id]).to be_a(String)
    
        expect(ability[:attributes]).to have_key(:name)
        expect(ability[:attributes][:name]).to be_a(String)
    
        expect(ability[:attributes]).to have_key(:description)
        expect(ability[:attributes][:description]).to be_a(String)
      end
    end
  end

  it "returns one unit" do
    response = WhService.get_unit_by_id(1)

      expect(response).to be_a Hash
      expect(response[:data]).to be_a Hash

      unit = response[:data]

      expect(unit).to have_key(:id)
      expect(unit[:id]).to be_a(String)

      expect(unit[:attributes]).to have_key(:name)
      expect(unit[:attributes][:name]).to be_a(String)

      expect(unit[:attributes]).to have_key(:movement)
      expect(unit[:attributes][:movement]).to be_a(Integer)

      expect(unit[:attributes]).to have_key(:toughness)
      expect(unit[:attributes][:toughness]).to be_a(Integer)

      expect(unit[:attributes]).to have_key(:sv)
      expect(unit[:attributes][:sv]).to be_a(Integer)

      expect(unit[:attributes]).to have_key(:invul_sv)
      if unit[:attributes][:invul_sv].nil?
        expect(unit[:attributes][:invul_sv]).to be_nil
      else
        expect(unit[:attributes][:invul_sv]).to be_a(Integer)
      end

      expect(unit[:attributes]).to have_key(:wounds)
      expect(unit[:attributes][:wounds]).to be_a(Integer)

      expect(unit[:attributes]).to have_key(:leadership)
      expect(unit[:attributes][:leadership]).to be_a(Integer)

      expect(unit[:attributes]).to have_key(:objective_control)
      expect(unit[:attributes][:objective_control]).to be_a(Integer)

      unit[:weapons][:data].each do |weapon|
        expect(weapon).to have_key(:id)
        expect(weapon[:id]).to be_a(String)
    
        expect(weapon[:attributes]).to have_key(:name)
        expect(weapon[:attributes][:name]).to be_a(String)
    
        expect(weapon[:attributes]).to have_key(:attacks)
        expect(weapon[:attributes][:attacks]).to be_a(String)
    
        expect(weapon[:attributes]).to have_key(:ws)
        expect(weapon[:attributes][:ws]).to be_a(Integer)
    
        expect(weapon[:attributes]).to have_key(:strength)
        expect(weapon[:attributes][:strength]).to be_a(Integer)

        expect(weapon[:attributes]).to have_key(:ap)
        expect(weapon[:attributes][:ap]).to be_a(Integer)

        expect(weapon[:attributes]).to have_key(:damage)
        expect(weapon[:attributes][:damage]).to be_a(String)

        expect(weapon[:attributes]).to have_key(:range)
        if weapon[:attributes][:range].nil?
          expect(weapon[:attributes][:range]).to be_nil
        else
          expect(weapon[:attributes][:range]).to be_a(Integer)
        end

        weapon[:abilities][:data].each do |ability|
          expect(ability).to have_key(:id)
          expect(ability[:id]).to be_a(String)
      
          expect(ability[:attributes]).to have_key(:name)
          expect(ability[:attributes][:name]).to be_a(String)
      
          expect(ability[:attributes]).to have_key(:description)
          expect(ability[:attributes][:description]).to be_a(String)
        end
      end
  end
end