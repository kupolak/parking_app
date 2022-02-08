require "rails_helper"

RSpec.describe Booking, type: :model do
  describe "associations" do
    it { should belong_to(:spot) }
    it { should belong_to(:user).optional }
  end

  describe "callbacks" do
    before do
      @user = User.create!(member_id: "123")
      @spot = Spot.create!
    end

    it "set_pickup_time" do
      spot = Booking.create!(user_id: @user.id, spot_id: @spot.id)
      expect(spot).to receive(:set_pickup_time)
      spot.run_callbacks(:create)
    end

    it "set_return_time" do
      spot = Booking.create!(user_id: @user.id, spot_id: @spot.id)
      expect(spot).to receive(:set_return_time)
      spot.run_callbacks(:create)
    end

    it "change_spot_status_to_reserved" do
      spot = Booking.create!(user_id: @user.id, spot_id: @spot.id)
      expect(spot).to receive(:change_spot_status_to_reserved)
      spot.run_callbacks(:create)
    end
  end
end
