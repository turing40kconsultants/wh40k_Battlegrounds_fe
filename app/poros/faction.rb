class Faction
  attr_reader :name, :id

  def initialize(faction_data)
    @name = faction_data[:attributes][:name]
    @id = faction_data[:id]
  end
end