FactoryGirl.define do
 
  factory :stash_tunnel, :class => StashTunnel do
    stash_id 1
    network_stash_id 2
    comment "Test comment"
  end
  
end