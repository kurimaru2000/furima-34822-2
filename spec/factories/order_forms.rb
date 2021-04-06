FactoryBot.define do
  factory :order_form do
    postal_code           { '989-3125' }
    perfecture_id         { 2 }
    city                  { '小田原市本町'  }
    numbering             { '2−9−17'  }
    building_name         { '降間ビル301' }
    telephone_number      { '08012345678' }
    token                 { 'tok_abcdefghijk00000000000000000' }
  end
end
