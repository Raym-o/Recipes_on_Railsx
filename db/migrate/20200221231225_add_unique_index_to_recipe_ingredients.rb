# frozen_string_literal: true

class AddUniqueIndexToRecipeIngredients < ActiveRecord::Migration[6.0]
  def change
    add_index :recipe_ingredients, %i[recipe_id ingredient_id], unique: true
  end
end
