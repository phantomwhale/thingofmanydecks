class DecksController < ApplicationController
  def new
    @deck = DeckForm.new
  end

  def show
    @deck = Deck.find(params[:id])
  end

  def create
    @deck = DeckForm.new(deck_params)

    if @deck.valid?
      @deck.save
      @deck.model.cards.shuffle!
      redirect_to @deck.model, notice: "Deck was successfully created"
    else
      render 'new'
    end
  end

  def draw
    @deck = Deck.find(params[:deck_id])
    @card = @deck.draw
    render :show
  end

  private

  def deck_params
    params.require(:deck_form).permit(:name, :description, :cards)
  end
end
