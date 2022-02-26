FactoryBot.define do
    factory :user do
      name{"左近次"}
      sequence(:email) { |n| "sakonji#{n}@sakonji"}
      password {"sakosako"}
      password_confirmation {"sakosako"}
    end
  end
