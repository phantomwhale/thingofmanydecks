class GamesController < ApplicationController
  def show
    @deck = Deck.find_by(share_token: params[:id])
  end

  def draw
    @deck = Deck.find_by(share_token: params[:game_id])
    @card = @deck.draw
    render :show
  end

  def shuffle
    @deck = Deck.find_by(share_token: params[:game_id])
    @deck.cards.shuffle!
  end
end
