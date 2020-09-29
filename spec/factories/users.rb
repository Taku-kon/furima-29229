FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"123456"}
    password_confirmation {password}
    first_name            {"山田"}
    last_name             {"太郎"}
    first_kana            {"ヤマダ"}
    last_kana             {"タロウ"}
    birthday              {1930-01-01}
  end
end