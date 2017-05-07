class DeckForm
  include ActiveModel::Model
  include Virtus.model

  attribute :name, String
  attribute :description, String
  attribute :cards, String

  attr_reader :deck

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  def model
    @deck
  end

  private

  def persist!
    @deck = Deck.create!(name: name, description: description)
    cards.split("\n").map do |card_name|
      @deck.cards << Card.create(name: card_name)
    end
  end
end
