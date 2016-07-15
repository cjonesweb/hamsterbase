require 'spec_helper'

describe ApplicationHelper do
  describe "#list_parent_stashes" do
    it 'should populate a list of parentless stashes to be used in layouts, etc...' do
      helper.list_parent_stashes.should eq Stash.order('title ASC').where(:parent_id => nil)
    end
  end

end
