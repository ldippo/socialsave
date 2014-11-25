FactoryGirl.define do
  factory :user do
    name "Lyle Dippo"
    email "ldippo421@gmail.com"
    password "please123"

    trait :admin do
      role 'admin'
    end

  end
end
