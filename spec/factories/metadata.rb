FactoryGirl.define do
 
  factory :metadata, :class => Metadatum do
    stash_id 1
    name "test name"
    content "test content"
  end
  
end