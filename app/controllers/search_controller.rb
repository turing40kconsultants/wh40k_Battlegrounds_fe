class SearchController < ApplicationController
  def index
    #should store this in something
    @factions = Wh40kBgsFacade.new.all_factions
    # binding.pry
    if params[:faction_id]
      # should probably store this in something
      # should create a new endpoint for get_unit_by_id
      @units_json = WhService.get_units_by_faction(params[:faction_id])
      # binding.pry
    end
  end
end