FactoryGirl.define do
  factory :item do
    name {Faker::Name.name}
    description {Faker::Lorem.sentence}
    image_url {Faker::Avatar.image}
  end
end
