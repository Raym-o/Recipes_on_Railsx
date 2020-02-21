# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_many :recipe_menus
  has_many :menus, through: :recipe_menus
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates :name, presence: true
end
