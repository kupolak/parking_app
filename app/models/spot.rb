class Spot < ApplicationRecord
  has_many :bookings
  enum status: %w[available reserved]
end
