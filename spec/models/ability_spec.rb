require 'spec_helper'
require "cancan/matchers"

describe Ability do

  before(:each) do
    @user = User.new
    @admin_user = FactoryGirl.create(:loginuser)
    @limited_ability = Ability.new(@user)
    @admin_ability = Ability.new(@admin_user)
  end
  
  #users
  
  it 'should allow admin users to create new users' do
    @admin_ability.should be_able_to(:create, User.new)
  end
  
  it 'should allow admin users to view users' do
    @admin_ability.should be_able_to(:read, User.new)
  end
  
  it 'should allow admin users to udpate users' do
    @admin_ability.should be_able_to(:update, User.new)
  end
  
  it 'should allow admin users to delete users' do
    @admin_ability.should be_able_to(:delete, User.new)
  end
  
  it 'should NOT allow regular visitors to create new users' do
    @limited_ability.should_not be_able_to(:create, User.new)
  end
  
  it 'should NOT allow regular visitors to view users' do
    @limited_ability.should_not be_able_to(:read, User.new)
  end
  
  it 'should NOT allow regular visitors to update users' do
    @limited_ability.should_not be_able_to(:update, User.new)
  end
  
  it 'should NOT allow regular visitors to delete users' do
    @limited_ability.should_not be_able_to(:delete, User.new)
  end
  
  
  #stashes
  
  it 'should allow admin users to create new stashes' do
    @admin_ability.should be_able_to(:create, Stash.new)
  end
  
  it 'should allow admin users to view stashes' do
    @admin_ability.should be_able_to(:read, Stash.new)
  end
  
  it 'should allow admin users to update stashes' do
    @admin_ability.should be_able_to(:update, Stash.new)
  end
  
  it 'should allow admin users to delete stashes' do
    @admin_ability.should be_able_to(:delete, Stash.new)
  end
  
  it 'should NOT allow regular visitors to create new stashes' do
    @limited_ability.should_not be_able_to(:create, Stash.new)
  end
  
  it 'should allow regular visitors to view stashes' do
    @limited_ability.should be_able_to(:read, Stash.new)
  end
  
  it 'should NOT allow regular visitors to update stashes' do
    @limited_ability.should_not be_able_to(:update, Stash.new)
  end
  
  it 'should NOT allow regular visitors to delete stashes' do
    @limited_ability.should_not be_able_to(:delete, Stash.new)
  end
  
  #stash_tunnels
  
  it 'should allow admin users to create new stash tunnels' do
    @admin_ability.should be_able_to(:create, StashTunnel.new)
  end
  
  it 'should allow admin users to view stash tunnels' do
    @admin_ability.should be_able_to(:read, StashTunnel.new)
  end
  
  it 'should allow admin users to update stash tunnels' do
    @admin_ability.should be_able_to(:update, StashTunnel.new)
  end
  
  it 'should allow admin users to delete stash tunnels' do
    @admin_ability.should be_able_to(:delete, StashTunnel.new)
  end
  
  it 'should NOT allow regular visitors to create new stash tunnels' do
    @limited_ability.should_not be_able_to(:create, StashTunnel.new)
  end
  
  it 'should allow regular visitors to view stash tunnels' do
    @limited_ability.should be_able_to(:read, StashTunnel.new)
  end
  
  it 'should NOT allow regular visitors to update stash tunnels' do
    @limited_ability.should_not be_able_to(:update, StashTunnel.new)
  end
  
  it 'should NOT allow regular visitors to delete stash tunnels' do
    @limited_ability.should_not be_able_to(:delete, StashTunnel.new)
  end
  
  #metadatum
  
  it 'should allow admin users to create new metadatum' do
    @admin_ability.should be_able_to(:create, Metadatum.new)
  end
  
  it 'should allow admin users to view metadatum' do
    @admin_ability.should be_able_to(:read, Metadatum.new)
  end
  
  it 'should allow admin users to update metadatum' do
    @admin_ability.should be_able_to(:update, Metadatum.new)
  end
  
  it 'should allow admin users to delete metadatum' do
    @admin_ability.should be_able_to(:delete, Metadatum.new)
  end
  
  it 'should NOT allow regular visitors to create new metadatum' do
    @limited_ability.should_not be_able_to(:create, Metadatum.new)
  end
  
  it 'should allow regular visitors to view metadatum' do
    @limited_ability.should be_able_to(:read, Metadatum.new)
  end
  
  it 'should NOT allow regular visitors to update metadatum' do
    @limited_ability.should_not be_able_to(:update, Metadatum.new)
  end
  
  it 'should NOT allow regular visitors to delete metadatum' do
    @limited_ability.should_not be_able_to(:delete, Metadatum.new)
  end
  
  #comments
  
  it 'should allow admin users to create new comments' do
    @admin_ability.should be_able_to(:create, Comment.new)
  end
  
  it 'should allow admin users to view comments' do
    @admin_ability.should be_able_to(:read, Comment.new)
  end
  
  it 'should allow admin users to update comments' do
    @admin_ability.should be_able_to(:update, Comment.new)
  end
  
  it 'should allow admin users to delete comments' do
    @admin_ability.should be_able_to(:delete, Comment.new)
  end
  
  it 'should allow regular visitors to create comments' do
    @limited_ability.should be_able_to(:create, Comment.new)
  end
  
  it 'should NOT allow regular visitors to create comments with the moderated flag set to TRUE' do
    @limited_ability.should_not be_able_to(:create, Comment.new(:moderated => TRUE))
  end
  
  it 'should allow regular visitors to view comments' do
    @limited_ability.should be_able_to(:read, Comment.new)
  end
  
  it 'should NOT allow regular visitors to update comments' do
    @limited_ability.should_not be_able_to(:update, Comment.new)
  end
  
  it 'should NOT allow regular visitors to delete comments' do
    @limited_ability.should_not be_able_to(:delete, Comment.new)
  end
  
  
end
