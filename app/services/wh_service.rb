class WhService
  def self.conn
    Faraday.new(url: "https://wh40k-battlegrounds-be-ce09c759206c.herokuapp.com") do |faraday|
    end
  end

  def self.get_factions
    response = conn.get("/api/v1/factions")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_units_by_faction(faction_id)
    response = conn.get("/api/v1/factions/#{faction_id}/units")
    JSON.parse(response.body, symbolize_names: true)
  end
end