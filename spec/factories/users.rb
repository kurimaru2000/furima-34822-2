FactoryBot.define do
  factory :user do
    nickname { Gimei.kanji }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 5) + '1' }
    password_confirmation { password }
    first_name            { Gimei.first.kanji }
    first_name_kana       { Gimei.first.katakana }
    last_name             { Gimei.last.kanji }
    last_name_kana        { Gimei.last.katakana }
    birth_day             { Faker::Date.between(from: '1930-01-01', to: '2020-12-31') }

  end
end
