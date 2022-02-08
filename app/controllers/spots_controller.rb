class SpotsController < ApplicationController
  def index
    ReleaseParkingSpotJob.perform_now
    @spots = Spot.all
  end
end
