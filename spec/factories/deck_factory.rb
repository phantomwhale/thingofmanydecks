FactoryGirl.define do
  factory :deck do
    name "deck name"
    description "deck description"

    factory :deck_with_cards do
      transient do
        card_count 5
      end

      after(:create) do |deck, evaluator|
        create_list(:card, evaluator.card_count, deck: deck)
      end
    end
  end
end
