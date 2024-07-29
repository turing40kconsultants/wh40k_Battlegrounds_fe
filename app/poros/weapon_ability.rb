class WeaponAbility
  attr_reader :name, :id, :description

  def initialize(ability_data)
    @id = ability_data[:id]
    @name = ability_data[:attributes][:name]
    @description = ability_data[:attributes][:description]
  end
end