FactoryBot.define do
  factory :address do
    postal_code        { "167-0052" }
    prefecture_id      { 14 }
    city               {"杉並区"}
    house_number       {"南荻窪3-1-2"}
    building_name      {"ヴォルト301"}
    phone_num          { "09012345678" }
  end
end
