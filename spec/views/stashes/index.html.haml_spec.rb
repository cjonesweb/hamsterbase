require 'spec_helper'
require 'will_paginate/array'

describe "stashes/index" do
  before(:each) do
    
    @request.env["devise.mapping"] = Devise.mappings[:loginuser]
    user = FactoryGirl.create(:loginuser)
    sign_in user
    
    assign :stashes, ([FactoryGirl.create(:stash),
      FactoryGirl.create(:stash),
      FactoryGirl.create(:stash),
      FactoryGirl.create(:stash)]).paginate
  end

  it "renders a list of stashes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Test Title/)
    rendered.should match(/Test Body/)
  end
end
