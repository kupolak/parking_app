class User < ApplicationRecord
  has_many :bookings, dependent: :nullify
end
