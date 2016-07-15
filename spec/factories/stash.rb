FactoryGirl.define do
 
  factory :stash, :class => Stash do
    title "Test Title"
    body "Test Body"
    url "http://www.test.url/"
  end
  
  factory :parent_stash, :class => Stash do
    title "Parent Stash"
    body "Parent Stash"
    parent_id nil
  end
  
  factory :different_stash, :class => Stash do
    title "Different Stash"
    body "Different Stash"
  end
  
end