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

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Post was successfully destroyed." }
    end
  end

  def user_bookings
    @user_bookings = Booking.where(user: User.where(id: 3))
  end
end
