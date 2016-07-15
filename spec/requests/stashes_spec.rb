require 'spec_helper'

describe "Stashes" do
  describe "GET /stashes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get stashes_path
      response.status.should be(200)
    end
  end
end
