require "rails_helper"

RSpec.describe "Game", type: :Poro do

  necron_units = JSON.parse(File.read('spec/fixtures/necron_units.json'), symbolize_names: true)[:data]

  ctan_data = necron_units.find { |unit| unit[:id] == '29'}
  let(:ctan) { Unit.new(ctan_data) }

  orikan_data = necron_units.find { |unit| unit[:id] == '1'}
  let(:orikan) { Unit.new(orikan_data) }

  dark_angel_units = JSON.parse(File.read('spec/fixtures/dark_angel_units.json'), symbolize_names: true)[:data]
  lion_data = dark_angel_units.find { |unit| unit[:id] == '65'}
  let(:lion) { Unit.new(lion_data) }


  describe "#initialize" do
    it 'is an instance of Game' do
        game = Game.new(lion, ctan)

        expect(game).to be_an_instance_of Game
        expect(game.attacker).to eq(lion)
        expect(game.defender).to eq(ctan)
    end
  end

  describe 'using Scythe of the Nightbringer - strike' do
    it 'applies at least one wound to CTan Shard of the Nightbringer' do
      game = Game.new(lion, ctan)
      # Stub rand to ensure hits and wounds
      # allow(scythe).to receive(:rand).and_return(4, 4, 2, 3, 5, 3, # 6 Succesful hits
      #                                                 1, 2, 3, 4, 5, 5)  # 4 Successful wound rolls

      # # Execute the melee method
      # result = scythe.attack(ctan)

      # Check the resulting wounds after being shot

      allow(game).to receive(:roll_to_hit).and_return(6)
      allow(game).to receive(:roll_to_wound).and_return(4)
      allow(game).to receive(:apply_saves).and_return(2)
      allow(game).to receive(:apply_damage).and_return(8)

      expect(game.attack(ctan)).to eq(8)
      #need to find some way to check wounds
    end
  end

  describe '#roll_to_hit' do
    it 'accounts for hits properly' do
      game = Game.new(lion, ctan)
      allow(game).to receive(:rand).and_return(1, 1, 1, 1, 1, 3, 4, 5, # 3 successful hits
                                                1, 5, 6, #1 failed wound, 2 wounds to be saved
                                                1, 2) # 2 failed save rolls

      game.attack(ctan)
    
      expect(game.roll_to_hit).to eq(3)
    end
    it 'accounts for hits properly' do
      game = Game.new(lion, ctan)
      allow(game).to receive(:rand).and_return(6,6,1,1)
    
      expect(game.roll_to_hit).to eq(2)
    end
  end

  describe '#wound_check' do
    it 'calculates wound threshold correctly' do
      game = Game.new(lion, ctan)
      
      expect(game.wound_check(ctan)).to eq(6)  # Lion gun is S4 vs CTAN T11
    end
  end

  describe '#calculate_best_save' do
    it 'calculates the best save correctly' do
      game = Game.new(lion, ctan)
      
      expect(game.calculate_best_save(ctan)).to eq(4)  # Assuming CTan's invul save is better
    end
  end

  describe '#apply_damage' do
    it 'applies correct amount of damage' do
      game = Game.new(lion, ctan)
      allow(game).to receive(:weapon_damage_roll).and_return(2)
      
      initial_wounds = ctan.wounds
      game.apply_damage(2, ctan)

      expect(ctan.wounds).to eq(8)
    end
  end

  describe '#weapon_damage_roll' do
    it 'handles fixed damage correctly' do
      game = Game.new(lion, ctan)
      allow(lion.weapons.first).to receive(:damage).and_return(2)
      
      expect(game.weapon_damage_roll).to eq(2)
    end

    it 'handles variable damage correctly' do
      game = Game.new(orikan, lion)
      allow(orikan.weapons.first).to receive(:damage).and_return(3)
      
      expect(game.weapon_damage_roll).to eq(3)
    end
  end

  describe '#attack' do
    it 'resolves a full attack sequence correctly' do
      game = Game.new(lion, ctan)
      allow(game).to receive(:roll_to_hit).and_return(3)
      allow(game).to receive(:roll_to_wound).and_return(2)
      allow(game).to receive(:apply_saves).and_return(1)
      allow(game).to receive(:weapon_damage_roll).and_return(2)

      damage_dealt = game.attack(ctan)
      
      expect(damage_dealt).to eq(2)
      expect(ctan.wounds).to eq(10)
    end
  end
end