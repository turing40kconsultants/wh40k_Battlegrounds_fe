class FightController < ApplicationController
  def index
    @attacker = Unit.new(JSON.parse(params[:attacker], symbolize_names: true))
    @defender = Unit.new(JSON.parse(params[:defender], symbolize_names: true))
    # binding.pry

    game = Game.new(@attacker, @defender)
    # binding.pry
    @wounds = game.attack(@defender)

    if @wounds >= @defender.wounds
      @kills = 1
    end

    redirect_to results_path(wounds: @wounds, kills: @kills)
  end
end