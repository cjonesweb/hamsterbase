require 'spec_helper'

describe "metadata/edit" do
  before(:each) do
    @metadatum = FactoryGirl.create(:metadata)
    @stashes_unpaged = [FactoryGirl.create(:stash)]
    #puts "@metadatum.inspect #{@metadatum.inspect}"
  end

  it "renders the edit metadatum form" do
    render
    rendered.should match /form/
  end
  
  it "adds a came from stash hidden tag if the instance variable is set" do
    @came_from_stash = TRUE
    render
    rendered.should match /came_from_stash/
  end
  
end
