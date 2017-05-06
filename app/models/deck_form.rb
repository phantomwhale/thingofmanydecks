class DeckForm < Reform::Form
  property :name
  property :description
  property :cards

  def cards
    model.cards.collect(&:name).join("\n")
  end

  def cards=(cards)
    cards.split("\n").map { |name| model.cards << Card.new(name: name) }
  end
end
