class SessionsController < ApplicationController
  def create
    # @user = User.find_or_create_by(full_name: auth_hash.info.name, member_id: auth_hash.info.user_id)
    #
    # session[:user_id] = @user.id
    # redirect_to '/spots'

    # @user = User.find_or_create_from_auth_hash(env["omniauth.auth"])
    # session[:user_id] = @user.id



  end

  protected
  def auth_hash
    # p request.env['omniauth.auth']
    # p "test"
    # p request.env['omniauth.auth']
  end
end
