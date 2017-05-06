require 'rails_helper'

RSpec.feature 'Deck actions' do
  scenario 'Draw card' do
    deck = create :deck_with_cards
    first_card = deck.cards.first
    card_count = deck.cards.count

    visit "/decks/#{deck.id}"

    click_button 'Draw card'

    expect(page).to have_text(first_card.name)
    expect(page).to have_text("Card count: #{card_count - 1}")
  end

  scenario 'Deck is empty' do
    deck = create :deck_with_no_cards

    visit "/decks/#{deck.id}"

    expect(page).to have_button('Draw card', disabled: true)
  end
end
