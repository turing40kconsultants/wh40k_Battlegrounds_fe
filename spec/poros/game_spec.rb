require "rails_helper"

RSpec.describe "Game", type: :Poro do
  let(:json_weapon) { WhService.get_units_by_faction(1)[:data].first[:weapons][:data].first }
  let(:scythe) { Weapon.new(json_weapon) }

  let(:json_unit) { WhService.get_units_by_faction(1)[:data].first }
  let(:ctan) { Unit.new(json_unit) }

  let(:json_unit2) { WhService.get_units_by_faction(2)[:data].first }
  let(:lion) { Unit.new(json_unit2) }


  # let(:cultist) {Unit.new('Cultist Mob', 6, 3, 6, 1, 7, 1, nil)}
  # let(:terminator) {Unit.new('Terminator', 5, 5, 2, 3, 6, 1, 4)}

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
                                                1, 5, 6) #1 failed wound
      game.attack(ctan)
    
      expect(game.apply_saves).to eq(2)
    end
  end
end