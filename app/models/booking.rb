class Booking < ApplicationRecord
  belongs_to :spot
  belongs_to :user

  after_create :set_expiration_time

  def set_expiration_time
    Time.now + 1.day
  end
end
