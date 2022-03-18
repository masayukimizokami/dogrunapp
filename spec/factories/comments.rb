FactoryBot.define do
  factory :comment do
    dogrun
    user
    title { "広かったです。" }
    contents { "とっても広くて、砂の上を走るのも気持ちよかったです。" }
  end
end
