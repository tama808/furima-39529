FactoryBot.define do
  factory :purchase_shipping do
    postcode { "#{Faker::Number.between(from: 100, to: 999)}-#{Faker::Number.between(from: 1000, to: 9999)}" }
    prefecture_id { 2 }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    building_name { nil }
    tel { Faker::PhoneNumber.cell_phone.gsub(/\D/, '') }

    # user と item の関連付け
    association :user
    association :item
  end
end


