FactoryBot.define do
  factory :form do
    postcode               {"123-4567"}
    prefecture_id          {2}
    city                   {"藤沢市"}
    address                {"本町2-2-2"}
    building_name          {"クマガイビル"}
    phone_number           {"09012345678"}
    token                  {"tok_abcdefghijk00000000000000000"}
  end
end
