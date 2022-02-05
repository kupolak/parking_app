class Spot < ApplicationRecord
  has_many :booking
  enum status: %w[available reserved]
end
