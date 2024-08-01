class ResultsController < ApplicationController
  def show
    # binding.pry
    @wounds = params[:wounds]
    @kills = params[:kills] || 0
  end
end