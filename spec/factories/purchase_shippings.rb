FactoryBot.define do
  factory :purchase_shipping do
    postcode { '153-0063' }
    prefecture_id { 2 }
    city { '東京都'}
    address { '1-1' }
    building_name { '東京は' }
    tel {  '12345123451' }
    token { 'sample_token' }
  end
end


