class BookingsController < ApplicationController
  def index
    @spots = Booking.all
    respond_to do |format|
      format.html
    end
  end

  def show
    @spot = Booking.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
end
