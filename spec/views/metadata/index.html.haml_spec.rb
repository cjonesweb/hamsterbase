require 'spec_helper'

describe "metadata/index" do
  before(:each) do
    assign(:metadata, [
      FactoryGirl.create(:metadata),
      FactoryGirl.create(:metadata),

    ])
  end

  it "renders a list of metadata" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match /test name/
    rendered.should match /test content/

  end
end
