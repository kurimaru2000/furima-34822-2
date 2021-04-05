FactoryBot.define do
  factory :buyer do
    postal_code           { '989-3125' }
    perfecture_id         { 2 }
    city                  { '小田原市本町'  }
    numbering             { '2−9−17'  }
    building_name         { '降間ビル301' }
    telephone_number      { '08012345678' }

    # after(:build) do |product|
    # product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    # end
  end
end
