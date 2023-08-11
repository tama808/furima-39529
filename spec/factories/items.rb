FactoryBot.define do
  factory :item do
    product              { Faker::Lorem.sentence }
    description          { Faker::Lorem.sentence }
    category_id          {2}
    condition_id         { Faker::Number.between(from: 2, to: 6) }
    shipping_cost_id     { Faker::Number.between(from: 2, to: 3) }
    prefecture_id        { Faker::Number.between(from: 2, to: 47) }
    shipping_day_id      { Faker::Number.between(from: 2, to: 3) }
    price                { Faker::Number.between(from: 300, to: 9999999) }
    
    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'images', 'dummy.jpg')), filename: 'dummy.jpg', content_type: 'image/jpeg')
    end
    
  end
end




