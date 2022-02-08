class BookingsController < ApplicationController
  def index
    if current_user
      @bookings = Booking.all
    else
      redirect_to "/"
    end
  end

  def show
    @booking = Booking.create!(spot_id: params[:id], user_id: current_user.id)
    if @booking.spot.status == "Available"
      @booking.spot.update(status: "Reserved")
    end
    @booking.spot.save!
    redirect_to "/spots"
  end

  def user_bookings
    if current_user
      @user_bookings = Booking.where(user: current_user)
      @user_bookings = @user_bookings.joins(:spot).where(spot: {status: "Reserved"})
    else
      redirect_to "/"
    end
  end

  def release
    booking = Booking.where(spot_id: params[:id], user_id: current_user.id).first
    booking.spot.update(status: "Available")
    booking.update(user: nil)
    booking.save!
    redirect_to "/my_bookings"
  end
end
