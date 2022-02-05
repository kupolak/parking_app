require 'rails_helper'

RSpec.describe "spots/edit", type: :view do
  before(:each) do
    @spot = assign(:spot, Spot.create!())
  end

  it "renders the edit spot form" do
    render

    assert_select "form[action=?][method=?]", spot_path(@spot), "post" do
    end
  end
end
