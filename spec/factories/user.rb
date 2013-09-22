FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "dummy#{n}@dummy.com" }
    sequence(:username) { |n| "chuck#{n}norris" }
    password "example"
    password_confirmation { password }
  end

end