FactoryBot.define do
  factory :user do
    name {'testuser'}
    email {'testuser@example.com'}
    password {'password'}
    password_confirmation {'password'}
  end

  factory :user2, class: User do
    name { "testuser2" }
    email { "testuser2@example.com" }
    password { "password2" }
  end

end
