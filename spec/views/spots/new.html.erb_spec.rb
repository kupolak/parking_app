require 'rails_helper'

RSpec.describe "spots/new", type: :view do
  before(:each) do
    assign(:spot, Spot.new())
  end

  it "renders new spot form" do
    render

    assert_select "form[action=?][method=?]", spots_path, "post" do
    end
  end
end
