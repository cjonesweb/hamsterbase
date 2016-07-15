require 'spec_helper'

describe "metadata/new" do
  before(:each) do
    @metadatum = Metadatum.new
    @stashes_unpaged = [FactoryGirl.create(:stash)]
  end

  it "renders new metadatum form" do
    render
    rendered.should match /form/
  end

    # Run the generator again with the --webrat flag if you want to use webrat matchers
end
