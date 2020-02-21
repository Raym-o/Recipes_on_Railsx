# frozen_string_literal: true

class Ingredient < ApplicationRecord
  belongs_to :foodgroup
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  validates :name, presence: true
  validates :name, uniqueness: true
end
