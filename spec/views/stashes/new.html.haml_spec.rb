require 'spec_helper'

describe "stashes/new" do
  before(:each) do
    assign(:stash, Stash.new)
  end

  it "renders new stash form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => stashes_path, :method => "post" do
      assert_select "input#stash_title", :name => "stash[title]"
      assert_select "textarea#stash_body", :name => "stash[body]"
      assert_select "textarea#stash_url", :name => "stash[url]"
      
    end
  end
end
