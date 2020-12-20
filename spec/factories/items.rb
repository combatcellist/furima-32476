FactoryBot.define do
  factory :item do
    name                  {Faker::Name.initials(number: 2)}
    description           {"こんにちは"}
    category_id           {2}
    condition_id          {2}
    cost_id               {2}
    prefecture_id         {2}
    delivery_day_id       {2}
    price                {3000}
    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
