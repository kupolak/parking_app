require 'json'

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def slack
    auth = request.env['omniauth.auth']
    @user_info = auth["extra"]["user_info"]["user"]
    Rails.logger.info "SLACK OMNIAUTH\n" + auth.inspect + ", " + @user_info.inspect
    # check to make sure team id is correct
    @user = User.find_by(email: @user_info['profile']['email']) || User.find_by(slack_userid: @user_info['id'])
    if @user
      @user.update_existing_user(@user_info)
    else
      @user = User.new(is_approved: true, email: @user_info['profile']['email'], slack_userid: @user_info['id'], slack_username: @user_info['profile']['display_name'], name: @user_info['profile']['real_name'])
      if @user.slack_username == ""
        @user.slack_username = @user.name
      end
    end
    @user.save :validate => false
    sign_in_and_redirect @user
  end
end
