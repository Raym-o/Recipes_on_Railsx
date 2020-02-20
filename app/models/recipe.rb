# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_many :recipe_menus
  has_many :menus, through: :recipe_menus
  validates :name, presence: true
end
