class Weapon
  attr_reader :name, 
              :id, 
              :attacks,
              :ws,
              :strength,
              :ap,
              :damage,
              :range,
              :abilities

  def initialize(weapon_data)
    @id = weapon_data[:id]
    @name = weapon_data[:attributes][:name]
    @attacks = weapon_data[:attributes][:attacks]
    @ws = weapon_data[:attributes][:ws]
    @strength = weapon_data[:attributes][:strength]
    @ap = weapon_data[:attributes][:ap]
    @damage = weapon_data[:attributes][:damage]
    @range = weapon_data[:attributes][:range]
    @abilities = format_weapon_abilities(weapon_data[:abilities][:data])
  end

  def format_weapon_abilities(abilities_data)
    if !abilities_data.empty?
      []
    else
      abilities_data.map do |ability_data|
        WeaponAbility.new(ability_data)
      end
    end
  end

  # Dice rolls should be handled in game logic
  # def format_dice_to_integer(data)
  #   if data.is_a?(Integer)
  #     data
  #   elsif data.is_a?(String)
  #     String.split
  #     rand()
  #   end
  # end
end