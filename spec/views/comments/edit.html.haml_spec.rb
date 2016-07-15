require 'spec_helper'

describe "comments/edit" do
  before(:each) do
    @stash = FactoryGirl.create(:stash)
    @parent_comment = FactoryGirl.create(:parent_comment)
    @child_comment = FactoryGirl.create(:child_comment)
    @comment = FactoryGirl.create(:comment)
    @comment.parent = @parent_comment
    @comment.children << @child_comment
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comments_path(@comment), :method => "post" do
      assert_select "input#comment_username", :name => "comment[username]"
      assert_select "input#comment_email", :name => "comment[email]"
      assert_select "textarea#comment_body", :name => "comment[body]"

    end
  end
  
  
  it "should always have a stash id" do
    @parent_comment.stash_id = @stash.id
    render
    rendered.should match /#{@stash.id}/
  end
  
  it "should display the parent if it is a child comment" do
    @parent_comment.stash_id = @stash.id
    render
    rendered.should match /#{@parent_comment.username}/
    rendered.should match /#{@parent_comment.body}/
  end
  
  it "should render a came from stash hidden tag when a child comment is edited" do
    @came_from_stash = TRUE
    render
    #puts rendered
    rendered.should match /name="came_from_stash"/
    
  end
  
  
end
