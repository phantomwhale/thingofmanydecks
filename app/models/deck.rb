class Deck < ApplicationRecord
  has_secure_token :share_token

  has_many :cards, -> { order(position: :asc) } do
    def shuffle!
      sql = ''
      pluck(:id).shuffle.each_with_index do |id, index|
        sql += "when (id=#{id}) then #{index + 1} "
      end
      sql = ['postition=case', sql, 'end'].join(' ')
    end
  end

  def draw
    drawn_card = cards.first
    drawn_card.delete
    drawn_card
  end
end
