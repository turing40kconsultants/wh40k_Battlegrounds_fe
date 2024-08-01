class DashboardController < ApplicationController
  def index
    # redirect_to root_path if current_user.nil?
    # require 'pry'; binding.pry

    if params[:attacker]
      # require 'pry'; binding.pry
      @attacker = JSON.parse(params[:attacker], symbolize_names: true)
      cookies[:attacker] = params[:attacker]
    else
      @attacker = JSON.parse(cookies[:attacker], symbolize_names: true) if cookies[:attacker]
    end

    if params[:defender]
      @defender = JSON.parse(params[:defender], symbolize_names: true)
      cookies[:defender] = params[:defender]
      require 'pry'; binding.pry
    else
      @defender = JSON.parse(cookies[:defender], symbolize_names: true) if cookies[:defender]
    end
  end
end