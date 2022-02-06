class SessionsController < ApplicationController
  def create
    # @user = User.find_or_create_by(member_id: request.env['omniauth.strategy'].access_token.to_hash["user_id"])
    # session[:user_id] = @user.id
    # redirect_to '/'
    render plain: { access_token: request.env['omniauth.strategy'].access_token.to_hash,
                    auth_hash:  request.env['omniauth.auth']
    }.to_yaml
    # p "testy"
    # binding.pry
    # p request.env['omniauth.strategy']
    # p "dupa"
    # p request.env['omniauth.auth']
  end
end
