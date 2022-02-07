class Booking < ApplicationRecord
  belongs_to :spot
  belongs_to :user

  after_create :set_pickup_time, :set_return_time, :change_spot_status_to_reserved

  def set_pickup_time
    pickup = self
    pickup.pickup_time = Time.now
    pickup.save!
  end

  def set_return_time
    return_time = self
    return_time.return_time = (Time.now + 1.day)
    return_time.save!
  end

  def change_spot_status_to_reserved
    spot = self.spot
    spot.status = "Reserved"
    spot.save!
  end
end
