require "rails_helper"

RSpec.describe Spot, type: :model do
  describe 'associations' do
    it { should have_many(:bookings) }
  end

  describe "callbacks" do
    it "set_default_status" do
      spot = Spot.create!
      expect(spot).to receive(:set_default_status)
      spot.run_callbacks(:create)
    end
  end

  describe 'has right statues' do
    let(:status) { [:Available, :Reserved] }
    it "test" do
      status.each_with_index do |item, index|
        expect(described_class.statuses[item]).to eq index
      end
    end
  end
end
