class LoginController < ApplicationController
  def index
   
  end

  private

  def user_params
    params.require(user).permit(:email, :password, :password_digest)
  end
end