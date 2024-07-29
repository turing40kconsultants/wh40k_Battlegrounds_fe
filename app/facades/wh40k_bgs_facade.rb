class Wh40kBgsFacade
  def initialize()

  end

  def all_units(faction_id)
    json = WhService.get_factions(faction_id)

    json[:data].map do |unit_data|
      Unit.new(unit_data)
    end
  end
end