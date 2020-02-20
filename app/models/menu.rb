# frozen_string_literal: true

class Menu < ApplicationRecord
  has_many :recipe_menus
  has_many :recipes, through: :recipe_menus

  validates :name, presence: true
end
