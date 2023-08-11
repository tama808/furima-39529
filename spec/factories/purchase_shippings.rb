FactoryBot.define do
  factory :purchase_shipping do
    postcode { "#{Faker::Number.between(from: 100, to: 999)}-#{Faker::Number.between(from: 1000, to: 9999)}" }
    prefecture_id { 1 }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    building_name { Faker::Address.secondary_address }
    tel { Faker::PhoneNumber.cell_phone.gsub(/\D/, '') }  # 数値のみを残す
  end
end



