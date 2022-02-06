class Spot < ApplicationRecord
  has_many :bookings
  enum status: %w[Available Reserved]

  after_create :set_status

  def set_status
    self.status = "Available"
    self.save!
  end
end
