require 'rails_helper'

NUMBERS = %w(Ace Two Three Four Five Six Seven Eight Nine Ten Jack Queen King)
SUITS = %w(Clubs Hearts Diamonds Spades)

def playing_cards
  NUMBERS.flat_map { |number| SUITS.map { |suit| "#{number} of #{suit}" } }.join("\n")
end

RSpec.feature 'Deck creation' do
  scenario 'Create a deck' do
    visit '/decks/new'

    fill_in 'Name', with: 'Playing Cards'
    fill_in 'Description', with: 'Aces, jacks, spades and all that jazz'
    fill_in 'Cards', with: playing_cards

    click_button 'Create Deck'

    expect(page).to have_text('Deck was successfully created')
    expect(page).to have_text('Card count: 52')

    click_link('Game link')

    expect(page).to have_text('Card count: 52')
  end
end
