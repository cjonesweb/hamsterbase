require 'spec_helper'
include Devise::TestHelpers

describe "stashes/show" do
  before(:each) do
    
    @request.env["devise.mapping"] = Devise.mappings[:loginuser]
    user = FactoryGirl.create(:loginuser)
    sign_in user
    
    @stash = FactoryGirl.create(:parent_stash)
    @stash.children.create(FactoryGirl.attributes_for(:stash))
    
    @stashes_unpaged = [FactoryGirl.create(:stash),
      FactoryGirl.create(:stash),
      FactoryGirl.create(:stash)]

    @metadata = [FactoryGirl.create(:metadata)]
    
    @comments = [FactoryGirl.create(:comment)]
    @comments[0].children.create FactoryGirl.attributes_for(:child_comment)

    @meta_datum = Metadatum.new
    @new_comment = Comment.new

  end

  

  it "renders attributes in" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Parent Stash/)
    rendered.should match(/Test Title/)
    
  end
  
  it "should render a list of meta data associated with the given stash" do
    render
    #puts "Metadata inspect #{@metadata.inspect}"
    rendered.should match(/test name/)
    rendered.should match(/test content/)
  end
  
  it "should render a form to add new meta data to the given stash" do
    render
    rendered.should match(/Add Metadata/)
    rendered.should match(/came_from_stash/)
  end
  
  it "should render a list of comments" do
    render
    rendered.should match(/testuser/)
    rendered.should match(/test comment/)
  end
  
  it "should render any child comments" do
    render
    rendered.should match(/childcomment testuser/)
    rendered.should match(/test child comment/)
  end
  
  it "should render a form to add comments to the given stash" do
    render
    rendered.should match(/Leave a comment/)
  end
  
  it "should render links to respond to existing comments" do
    render
    rendered.should match(/Reply to this comment/)
  end  
    
  
end
