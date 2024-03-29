class Comment < ActiveRecord::Base
  attr_accessible :body, :email, :parent_id, :stash_id, :username, :moderated
  
  include ActiveRecord::Acts::Tree

  acts_as_tree :order => "created_at"
  
  #Note that these guys are not going to be real users. It's just a name to post under.

  validates :body, :presence => true
  validates :stash_id, :presence => true
  
  belongs_to :stash
  
end
