class Spot < ApplicationRecord
  has_many :bookings
  enum status: %w[Available Reserved Returned]

  after_create :set_default_status

  def set_default_status
    self.status = "Available"
    save!
  end
end
