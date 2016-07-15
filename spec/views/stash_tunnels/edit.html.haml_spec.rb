require 'spec_helper'

describe "stash_tunnels/edit" do
  before(:each) do
    @stash_tunnel = FactoryGirl.create(:stash_tunnel)
    @stashes_unpaged = [FactoryGirl.create(:stash),
      FactoryGirl.create(:stash)]
  end

  it "renders the edit stash_tunnel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => stash_tunnels_path(@stash_tunnel), :method => "post" 
  end
end
