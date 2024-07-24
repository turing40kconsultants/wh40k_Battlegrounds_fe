class UsersController < ApplicationController
  def new ; end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/dashboard"
    else
      redirect_to new_user_path
      flash[:notice] = "Failed to Create user :("
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_digest)
  end
end