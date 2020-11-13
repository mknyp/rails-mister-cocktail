class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy # delete child doses once deleted
  has_many :ingredients, through: :doses # through doses which is why this comes after doses
  validates :name, uniqueness: true, presence: true, allow_blank: false
  has_one_attached :photo
end

