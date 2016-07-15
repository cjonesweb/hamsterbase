require 'spec_helper'

describe "comments/new" do
  before(:each) do
    @stash = FactoryGirl.create(:stash)
    @comment = FactoryGirl.create(:comment)
    @parent_comment = FactoryGirl.create(:parent_comment)
  end

  it "renders new comment form" do
    render
    rendered.should match /form/
    # Run the generator again with the --webrat flag if you want to use webrat matchers

  end
end
