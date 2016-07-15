FactoryGirl.define do

  factory :comment, :class => Comment do
    stash_id 1
    username "testuser"
    email "testuser@test.com"
    body "test comment"
  end
  
  factory :child_comment, :class => Comment do
    stash_id 1
    username "childcomment testuser"
    email "childcomment@childcomment.com"
    body "test child comment"
  end
  
  factory :parent_comment, :class => Comment do
    stash_id 1
    username "parentcomment testuser"
    email "parentcomment@childcomment.com"
    body "test parent comment"
  end
  
end