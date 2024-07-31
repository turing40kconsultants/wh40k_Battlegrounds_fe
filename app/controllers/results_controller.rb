class ResultsController < ApplicationController
  def show
    @wounds = params[:wounds]
    @kills = params[:kills]
  end
end