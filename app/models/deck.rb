class Deck < ApplicationRecord
  has_many :cards

  def draw
    drawn_card = cards.first
    drawn_card.delete
    drawn_card
  end
end
