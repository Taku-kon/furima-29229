FactoryBot.define do
  factory :item do
    name            {"商品名"}
    text            {"商品説明"}
    price           {3000}
    user_id         {2}
    shipping_id     {2}
    ship_pla_id     {2}
    ship_day_id     {2}
    condition_id    {2}
    category_id     {2}
  end
end
