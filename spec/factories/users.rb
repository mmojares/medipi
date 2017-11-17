FactoryBot.define do
  factory :user do
    name { FFaker::Name.name }
    email 'email@email.com'
    password 'foobar'
  end
end
