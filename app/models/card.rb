class Card < ApplicationRecord
  belongs_to :deck
  acts_as_list scope: :deck
end
