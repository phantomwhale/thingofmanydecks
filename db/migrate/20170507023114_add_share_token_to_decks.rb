class AddShareTokenToDecks < ActiveRecord::Migration[5.1]
  def change
    add_column :decks, :share_token, :string
    add_index :decks, :share_token, unique: true
  end
end
