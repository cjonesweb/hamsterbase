FactoryGirl.define do

  factory :loginuser, :class => User do
    password "password"
    password_confirmation "password"
    username "loginuser"
    email "user@test.com"
    admin TRUE
  end
  
end  