require 'spec_helper'

describe Stash do
  
  it 'should be a valid instance of Stash' do
    @stash = FactoryGirl.create(:stash)
    @stash.should be_valid
  end
  
  it 'should link correctly to tunneled stashes' do
    @stash = FactoryGirl.create(:stash)
    @stashb = FactoryGirl.create(:stash)
    @stash.network_stashes << @stashb
    @stash.network_stashes.should eq [@stashb]
  end
  
  it 'should link correctly to inverse tunnels' do
    @stasha = FactoryGirl.create(:stash)
    @stashb = FactoryGirl.create(:different_stash)
    @stasha.network_stashes << @stashb
    @stashb.inverse_tunnels.should eq [@stasha]
  end
  
  it 'should build a list of all tunneled stashes' do
    @stasha = FactoryGirl.create(:stash)
    @stashb = FactoryGirl.create(:different_stash)
    @stashc = FactoryGirl.create(:parent_stash)
    @stasha.network_stashes << @stashb
    @stashc.network_stashes << @stasha
    @stasha.all_tunnels.should eq [@stashb, @stashc]
  end
    
  it 'should link correctly to associated metadata' do
    stash = FactoryGirl.create(:stash)
    metadata = FactoryGirl.create(:metadata)
    stash.metadata << metadata
    stash.metadata.should eq [metadata]
  end
  
  it 'should link correctly to associated comments' do
    stash = FactoryGirl.create(:stash)
    comment = FactoryGirl.create(:comment)
    stash.comments << comment
    stash.comments.should eq [comment]
  end
  
end
