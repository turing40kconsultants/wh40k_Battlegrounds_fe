class Unit
  attr_reader :name, :id

  def initialize(unit_data)
    binding.pry
    @id = unit_data[:id]
    @name = unit_data[:attributes][:name]
    @movement = unit_data[:attributes][:movement]
    @name = unit_data[:attributes][:name]
    @name = unit_data[:attributes][:name]
    @name = unit_data[:attributes][:name]
    @name = unit_data[:attributes][:name]
    @name = unit_data[:attributes][:name]
    @name = unit_data[:attributes][:name]
  end
end