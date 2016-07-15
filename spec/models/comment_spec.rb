require 'spec_helper'

describe Comment do
  pending "add some examples to (or delete) #{__FILE__}"
  
  it 'should not allow a comment with no stash_id to be saved' do
    comment = FactoryGirl.create(:comment)
    comment.stash_id = nil
    comment.save.should raise_error
  end
  
  
end
