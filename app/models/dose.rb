class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  validates :description, presence: true, allow_blank: false # alternative frmo Bugi: validates_uniqueness_of :cocktail, scope: :ingredient
  validates :cocktail, uniqueness: { scope: :ingredient }
end
