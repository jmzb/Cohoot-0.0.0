FactoryGirl.define do
  factory :user do
    first_name 'First'
    last_name  'Last'
    sequence(:email) {|n| "user#{n}@example.com"}

    password "mypassword"
    password_confirmation "mypassword"
  end

  factory :follow_user do
    association :user, factory: :user
    association :follower, factory: :user
    association :followed, factory: :user
  end

  
end
