class Unit
  attr_reader :name, 
              :id, 
              :movement, 
              :toughness, 
              :sv, 
              :invul_sv, 
              :wounds, 
              :leadership, 
              :objective_control, 
              :faction_id,
              :weapons

  def initialize(unit_data)
    @id = unit_data[:id]
    @name = unit_data[:attributes][:name]
    @movement = unit_data[:attributes][:movement]
    @toughness = unit_data[:attributes][:toughness]
    @sv = unit_data[:attributes][:sv]
    @invul_sv = unit_data[:attributes][:invul_sv]
    @wounds = unit_data[:attributes][:wounds]
    @leadership = unit_data[:attributes][:leadership]
    @objective_control = unit_data[:attributes][:objective_control]
    @faction_id = unit_data[:attributes][:faction_id]
    @weapons = format_weapons(unit_data[:weapons][:data])
  end

  def format_weapons(weapons_data)
    weapons_data.map do |weapon_data|
      Weapon.new(weapon_data)
    end
  end

end