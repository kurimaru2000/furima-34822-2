FactoryBot.define do
  factory :product do
    name                  { Gimei.prefecture.kanji  }
    category_id           { 2  }
    status_id             { 2  }
    delivery_fee_id       { 2  }
    perfecture_id         { 2  }
    delivery_days_id      { 2  }
    price                 { Faker::Number.number(digits: 7) }
    description           { Gimei.prefecture.kanji  }
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
