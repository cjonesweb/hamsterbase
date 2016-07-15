require 'spec_helper'

describe "stash_tunnels/new" do
  before(:each) do
    @stash_tunnel = FactoryGirl.create(:stash_tunnel)
    @stashes_unpaged = [FactoryGirl.create(:stash),
      FactoryGirl.create(:stash)]
  end

  it "renders new stash_tunnel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => stash_tunnels_path, :method => "post"
  end
end
