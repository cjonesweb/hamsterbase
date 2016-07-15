class StashTunnel < ActiveRecord::Base
  attr_accessible :comment, :stash_id, :network_stash_id
  
  validate :stash_id, :presence_of => true
  validate :network_stash_id, :presence_of => true
  
  belongs_to :stash
  belongs_to :network_stash, :class_name => "Stash"
end
