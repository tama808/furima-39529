FactoryBot.define do
  factory :purchase_shipping do
    postcode { '153-0063' }
    prefecture_id { 2 }
    city { 'test'}
    address { 'test'  }
    building_name { '' }
    tel {  '12345123451' }
    token { 'sample_token' }
    user_id{ 'sample_id' }
    item_id{ 'sample_id' }
  end
end


