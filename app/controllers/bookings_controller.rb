class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
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
    @booking = Booking.find_or_create_by(spot_id: params[:id], user_id: current_user.id)
    if @booking
      @booking.save!
      flash[:alert] = "Booked!"
      redirect_to "/spots"
    else
      flash[:alert] = "Error!"
    end
    respond_to do |format|
      format.html
    end
  end

  def user_bookings
    @user_bookings = Booking.where(user: current_user)
  end

  def booking_params
    params.require(:booking).permit(pickup_time, return_time, :spot_id, :user_id)
  end
end
