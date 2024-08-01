class FightController < ApplicationController
  def index
    @player = Unit.new(JSON.parse(params[:player], symbolize_names: true))
    @opponent = Unit.new(JSON.parse(params[:opponent], symbolize_names: true))
    # binding.pry

    game = Game.new(@player, @opponent)
    # binding.pry
    @wounds = game.attack(@opponent)

    if @wounds >= @opponent.wounds
      @kills = 1
    end

    redirect_to results_path(wounds: @wounds, kills: @kills)
  end
end