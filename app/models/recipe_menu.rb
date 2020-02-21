# frozen_string_literal: true

class RecipeMenu < ApplicationRecord
  belongs_to :recipe
  belongs_to :menu

  validates :menu_id, uniqueness: { scope: :recipe_id }
end
