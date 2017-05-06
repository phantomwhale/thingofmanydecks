FactoryGirl.define do
  sequence :name do |n|
    "Card ##{n}"
  end

  factory :card do
    name
  end
end
