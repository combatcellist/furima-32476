FactoryBot.define do
  factory :form do
    postcode               {000-0000}
    prefecture_id          {2}
    city                   {"藤沢市"}
    address                {"本町2-2-2"}
    phone_number           {Faker::PhoneNumber}
    token                  {"tok_abcdefghijk00000000000000000"}
  end
end
