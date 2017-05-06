class DecksController < ApplicationController
  def new
    @deck = DeckForm.new(Deck.new)
  end

  def show
    @deck = Deck.find(params[:id])
  end

  def create
    @deck = DeckForm.new(Deck.new)

    if @deck.validate(params[:deck])
      @deck.save
      redirect_to @deck, notice: "Deck was successfully created"
    end
  end
end
