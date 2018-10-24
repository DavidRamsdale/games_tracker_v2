class Game < ApplicationRecord
  belongs_to :user
  has_many :challengers
  has_many :scores
end
