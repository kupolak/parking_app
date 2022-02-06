class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    # respond_to do |format|
    #   format.html
    # end
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      format.html { redirect_to spot_path, notice: "Post was successfully created." }
    end
  end

  def show
    @booking = Booking.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def user_bookings
    @user_bookings = Booking.where(user: current_user)
  end

  def booking_params
    params.require(:booking).permit(:spot_id, :user_id)
  end
end
