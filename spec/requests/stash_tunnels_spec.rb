require 'spec_helper'

describe "StashTunnels" do
  describe "GET /stash_tunnels" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get stash_tunnels_path
      response.status.should be(200)
    end
  end
end
