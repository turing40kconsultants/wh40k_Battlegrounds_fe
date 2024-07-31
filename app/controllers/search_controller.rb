class SearchController < ApplicationController
  def index
    #should store this in something
    @factions = Wh40kBgsFacade.get_factions
    
    if params[:faction_id]
      # should probably store this in something
      @units = Wh40kBgsFacade.new.all_units(params[:faction_id])
    end
  end
end