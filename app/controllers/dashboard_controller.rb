class DashboardController < ApplicationController
  def index
    redirect_to root_path if current_user.nil?
  end
end