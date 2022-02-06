class SessionsController < ApplicationController
  def create
    # @user = User.find_or_create_by(full_name: auth_hash.info.name, member_id: auth_hash.info.user_id)
    #
    # session[:user_id] = @user.id
    # redirect_to '/'
    render plain: { access_token: request.env['omniauth.strategy'].access_token.to_hash,
                    auth_hash:  request.env['omniauth.auth']
    }.to_yaml
  end

  protected
  def auth_hash
    request.env['omniauth.auth']
  end
end