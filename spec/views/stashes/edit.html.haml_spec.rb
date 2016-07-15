require 'spec_helper'

describe "stashes/edit" do
  before(:each) do
    @stash = FactoryGirl.create(:stash)
  end

  it "renders the edit stash form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => stashes_path(@stash), :method => "post" do
      assert_select "input#stash_title", :name => "stash[title]"
      assert_select "textarea#stash_body", :name => "stash[body]"
      assert_select "textarea#stash_url", :name => "stash[url]"

    end
  end
end
