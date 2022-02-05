require 'rails_helper'

RSpec.describe "spots/index", type: :view do
  before(:each) do
    assign(:spots, [
      Spot.create!(),
      Spot.create!()
    ])
  end

  it "renders a list of spots" do
    render
  end
end
