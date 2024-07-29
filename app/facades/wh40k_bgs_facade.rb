class Wh40kBgsFacade
  def initialize()

  end

  def all_units
    json = # Wh40kBackendServices.get_all_factions

    json[:data].map do |unit_data|
      Unit.neew(unit_data)
    end
  end
end