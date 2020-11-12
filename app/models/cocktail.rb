class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses # through doses which is why this comes 2nd
  validates :name, uniqueness: true, presence: true
end
