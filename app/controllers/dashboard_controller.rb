class DashboardController < ApplicationController
  def index
    redirect_to root_path if current_user.nil?

    if params[:player1]
      @player1 = params[:player1]
    end

    if params[:player2]
      @player2 = params[:player2]
    end
  end
end