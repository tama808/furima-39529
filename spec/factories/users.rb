FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'t@test'}
    password              { Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation {password}
    birth                 {'1999-11-11'}
    family_name           {'山本'}
    k_family_name         {'ヤマモト'}
    first_name            {'陸'}
    k_first_name          {'リク'}
  
  end
 
end