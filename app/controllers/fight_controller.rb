class FightController < ApplicationController
  def resolve
    attacker = Unit.find(params[:attacker_id])
    defender = Unit.find(params[:defender_id])

    game = Game.new(attacker, defender)
    result = game.attack
  end
end