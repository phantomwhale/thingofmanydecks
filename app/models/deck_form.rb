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
    cards.each_line.map do |card_name|
      @deck.cards << create_cards_from(card_name.chomp)
    end
  end

  def create_cards_from(card_name)
    if match = /^(\d+)x(.*)/.match(card_name)
      Array.new(match[1].to_i) do
        Card.new(name: match[2])
      end
    else
      Card.new(name: card_name)
    end
  end
end
