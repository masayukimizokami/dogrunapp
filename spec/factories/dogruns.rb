FactoryBot.define do
  factory :dogrun do
    user
    dogrun_name { "鳥取砂丘ドッグラン" }
    address { "鳥取県" }
    pr { "砂丘で走り回れるドッグランです。" }
    area { "中四国" }
  end
end
