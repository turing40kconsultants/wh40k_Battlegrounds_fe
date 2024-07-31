class Wh40kBgsFacade
  def initialize()

  end

  def all_units(faction_id)
    json = WhService.get_units_by_faction(faction_id)
    json[:data].map do |unit_data|
      Unit.new(unit_data)
    end
  end

  def all_factions
    json = WhService.get_factions
    json[:data].map do |faction_data|
      Faction.new(faction_data)
    end
  end
end