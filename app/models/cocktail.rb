class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_one_attached :image

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :doses
end
