require 'spec_helper'

describe "stash_tunnels/index" do
  before(:each) do
    assign(:stash_tunnels, [
      FactoryGirl.create(:stash_tunnel),
      FactoryGirl.create(:stash_tunnel)
    ])
  end

  it "renders a list of stash_tunnels" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match /Test comment/
  end
end
