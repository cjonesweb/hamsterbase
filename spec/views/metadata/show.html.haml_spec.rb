require 'spec_helper'

describe "metadata/show" do
  before(:each) do
    @metadatum = FactoryGirl.create(:metadata)
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match /test name/
    rendered.should match /test content/
  end
end
