require 'rails_helper'

RSpec.feature 'Deck actions' do
  scenario 'Draw card' do
    create :deck_with_cards

  end
end
