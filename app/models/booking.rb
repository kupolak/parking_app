class Booking < ApplicationRecord
  belongs_to :spot
  belongs_to :user

  after_create :take_parking_space

  private

  def take_parking_space

  end
end
