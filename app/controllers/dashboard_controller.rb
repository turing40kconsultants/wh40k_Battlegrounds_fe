class DashboardController < ApplicationController
  def index
    # redirect_to root_path if current_user.nil?

    if params[:player]
      # binding.pry
      @player = JSON.parse(params[:player], symbolize_names: true)
      
    end

    if params[:opponent]
      @opponent = JSON.parse(params[:opponent], symbolize_names: true)
    end
  end
end