class HomeController < ApplicationController
  def index
    @current_user = current_user
    if @current_user
      redirect_to spots_path
    end
  end
end
