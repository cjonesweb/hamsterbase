require 'spec_helper'

describe "stash_tunnels/show" do
  before(:each) do
    @stash_tunnel = FactoryGirl.create(:stash_tunnel)
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Test comment/)
  end
end
