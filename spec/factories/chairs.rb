FactoryBot.define do
  factory :chair do
    name_type "monoblock"
    table { create :table }
  end
end
