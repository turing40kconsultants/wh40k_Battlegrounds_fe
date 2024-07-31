class FightController < ApplicationController
  def index
    # attacker = Unit.find(params[:attacker_id])
    # defender = Unit.find(params[:defender_id])
    
    @player = Unit.new(JSON.parse(params[:player], symbolize_names: true))
    @opponent = Unit.new(JSON.parse(params[:opponent], symbolize_names: true))
    # binding.pry

    game = Game.new(@player, @opponent)
    @result = game.attack(@apponent)
  end
end