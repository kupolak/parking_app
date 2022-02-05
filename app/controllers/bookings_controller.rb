class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    respond_to do |format|
      format.html
    end
  end

  def show
    @booking = Booking.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
end
