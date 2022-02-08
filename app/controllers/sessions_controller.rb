class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by(member_id: request.env["omniauth.strategy"].access_token.to_hash["user_id"])
    session[:user_id] = @user.id
    redirect_to "/"
  end
end
