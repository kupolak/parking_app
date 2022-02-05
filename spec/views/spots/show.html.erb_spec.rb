require 'rails_helper'

RSpec.describe "spots/show", type: :view do
  before(:each) do
    @spot = assign(:spot, Spot.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
